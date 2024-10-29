Return-Path: <linux-usb+bounces-16829-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E04229B49BD
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 13:33:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5ED8282CB4
	for <lists+linux-usb@lfdr.de>; Tue, 29 Oct 2024 12:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AFC92038B2;
	Tue, 29 Oct 2024 12:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFUJCGVj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6FCE539A
	for <linux-usb@vger.kernel.org>; Tue, 29 Oct 2024 12:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730205203; cv=none; b=VFTQohL31KHdmZDxL41KGTeM+K/0U2JrzR88OBJIOaWDFZzRSht4+rio/1azkD9VJEqVC4ILQ+kYcSObXJOgLFE0TayCHDn7qsTYlYBgb8uKy8cBG9xlZW/+MxtJSmEXZvzM/F9Gn0PAaNIsYfemhN2poYha9Fv1yXIN7LdkAXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730205203; c=relaxed/simple;
	bh=Xvys+vrVHO3+wot84Ea3Qdp3QMqHL/XYxlJwMQV81ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bM/kDvczDEDs0xvh/H7/hnJoAyzPTMPPZQWXx5+K3c8zNrALqVVdL+h7N2EBoTAp7LVJiiD2X655mZAFjBk90y9XovHaR1DpJs6m7tfAKBIZHgl44jQjzZKQR6+vUw6T7fYmEjiJoQ3xbvpP5T1a77lfR256PJzdxKjZkndfnp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFUJCGVj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33335C4CEE8;
	Tue, 29 Oct 2024 12:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730205203;
	bh=Xvys+vrVHO3+wot84Ea3Qdp3QMqHL/XYxlJwMQV81ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FFUJCGVjwvG2GkuyG5K5nETmgoB1wk7WAQhsauS1bk4tDJnDIJO/YMPZxc2a9YoB0
	 VLhz2Osi5Rn9th4b1DIk1XMWktsk+3sp+0+Z/vesActAkZ9Qv3GwXm95pvohBR0ZGw
	 UVcToONoSnkWYndMxiMnhonNWudRB2RWf1lMLcroOB1IuE1oCb2mH9HDTHbDbP3xbB
	 RmCVqzN+EmN08ugPt2zIBohS3MPmmf9V3laH5ZO7E7HwsMK7uRrYrsLhdFS216bzfG
	 Rokk9/OuWlogRdvPTOTUCB+KYGqR1a/X82aONkfT426Gh37g3RkkRG6SKJmXVFw9ha
	 P51b2u76n07nQ==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1t5lPr-000000001B5-02vb;
	Tue, 29 Oct 2024 13:33:43 +0100
Date: Tue, 29 Oct 2024 13:33:43 +0100
From: Johan Hovold <johan@kernel.org>
To: "Lukas M. Oosthuizen" <lukas@limotek.co.za>
Cc: linux-usb@vger.kernel.org
Subject: Re: Add Nations N32g43x usb to serial driver
Message-ID: <ZyDWJ0Lhd1zOT5uF@hovoldconsulting.com>
References: <daa4f855-6492-447b-bf49-a21fd2d2f077@limotek.co.za>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <daa4f855-6492-447b-bf49-a21fd2d2f077@limotek.co.za>

On Wed, Sep 25, 2024 at 12:26:35AM +0200, Lukas M. Oosthuizen wrote:

> Can you please add the following device to a proper driver:
> 
> */[  149.554092] usb 1-1.4: new full-speed USB device number 3 using 
> xhci_hcd
> [  149.661456] usb 1-1.4: New USB device found, idVendor=19f5, 
> idProduct=3245, bcdDevice= 1.00
> [  149.661476] usb 1-1.4: New USB device strings: Mfr=1, Product=2, 
> SerialNumber=3
> [  149.661489] usb 1-1.4: Product: N32g43xCustm HID
> [  149.661499] usb 1-1.4: Manufacturer: NATIONS
> [  149.661508] usb 1-1.4: SerialNumber: N32g43x
> [  149.681694] input: NATIONS N32g43xCustm HID as 
> /devices/platform/scb/fd500000.pcie/pci0000:00/0000:00:00.0/0000:01:00.0/usb1/1-1/1-1.4/1-1.4:1.0/0003:19F5:3245.0001/input/input4
> [  149.741001] hid-generic 0003:19F5:3245.0001: input,hidraw0: USB HID 
> v1.10 Keyboard [NATIONS N32g43xCustm HID] on usb-0000:01:00.0-1.4/input0

This appears to be a USB HID device and those would not be handled by
USB serial.

I think I saw someone posting a driver for a USB HID device recently,
but not sure what happened to it.

> [  149.794848] usbcore: registered new interface driver cdc_acm
> [  149.794862] cdc_acm: USB Abstract Control Model driver for USB modems 
> and ISDN adapters
> [  187.072026] usbcore: registered new interface driver usbserial_generic
> [  187.072095] usbserial: USB Serial support registered for generic
> [  187.072186] usbserial_generic 1-1.4:1.1: The "generic" usb-serial 
> driver is only for testing and one-off prototypes.
> [  187.072199] usbserial_generic 1-1.4:1.1: Tell 
> linux-usb@vger.kernel.org to add your device to a proper driver.
> [  187.072211] usbserial_generic 1-1.4:1.1: device has no bulk endpoints
> [  187.072268] usbserial_generic 1-1.4:1.2: The "generic" usb-serial 
> driver is only for testing and one-off prototypes.
> [  187.072278] usbserial_generic 1-1.4:1.2: Tell 
> linux-usb@vger.kernel.org to add your device to a proper driver.
> [  187.072287] usbserial_generic 1-1.4:1.2: generic converter detected
> [  187.072943] usb 1-1.4: generic converter now attached to ttyUSB0/*
> 
> */
> /*
> 
> Please let me know if you require anything else from my side.

Can you post the output of lsusb -v (or usb-devices) for this device?

Johan

