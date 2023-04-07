@extends('layouts.app')

@section('content')
    <product-page :product="{{ $product }}"></product-page>
@endsection
