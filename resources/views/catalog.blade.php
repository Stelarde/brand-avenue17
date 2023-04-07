@extends('layouts.app')

@section('content')
    <catalog-page :category="{{ $category }}"></catalog-page>
    <new-products></new-products>
@endsection
