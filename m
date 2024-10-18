Return-Path: <linux-usb+bounces-16427-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EF29A4433
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 18:56:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 414F91F23BB3
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2024 16:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7B2F2038C8;
	Fri, 18 Oct 2024 16:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=startmail.com header.i=@startmail.com header.b="Uro6yopG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mx-out2.startmail.com (mx-out2.startmail.com [145.131.90.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952782038B9
	for <linux-usb@vger.kernel.org>; Fri, 18 Oct 2024 16:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=145.131.90.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729270613; cv=none; b=s1vaTJpVJJXC0fB/91jNBmwvRmQvTsIPmjftwqUiGFuJ5YnARH34F6aTxrbsdf/4Bqgs6ghwZVqF35KFHflQkZvCsnP71VdbSHQJ37hR9ZcJQ2EoR680yrLhfbiOvm+vRXDFATgN3Qb5oGYiDGPpKeKY1iWVYOlJ4PUYA23l0tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729270613; c=relaxed/simple;
	bh=NNnTB8pDj1a3Wipkchl4kaYYuvm3K8uyNGJXSJRK+q4=;
	h=Message-ID:Date:Mime-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=KeIzS8o9YHMDvRFV/nXLhB9NRDD+0p4Y/5KPKw4JhAfwYqMY1Gy8AEW3SjAR6IwRmoBX9vxskGglzEogxyCy8pIVCI097PfYcgZYXzw9HE6ISBHFGoiruNZWaOjYFS/3cjkdaJ5Ef+nPX3RjZ0a1s/MhhwaY7CjQjbxq+EAwr9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=use.startmail.com; spf=pass smtp.mailfrom=use.startmail.com; dkim=pass (2048-bit key) header.d=startmail.com header.i=@startmail.com header.b=Uro6yopG; arc=none smtp.client-ip=145.131.90.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=use.startmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=use.startmail.com
Message-ID: <830fb71a-d259-4414-ad42-73a858a3bce6@use.startmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=startmail.com;
	s=2020-07; t=1729270608;
	bh=Gb/LdGJjWdBBxLSGJD0EdARAH382j6qfkzXe2cenHtY=;
	h=Message-ID:Date:Mime-Version:Subject:To:References:From:Reply-To:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:From:Subject:To:
	 Date:Sender:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition:Mime-Version:Reply-To:In-Reply-To:References:
	 Message-Id:Autocrypt;
	b=Uro6yopGZz2kZnDDPE3Yuh3j9NA6ELk4CqRx5xnD862s/X+uPFJcqwLAPUweCRf7C
	 iZHW2/WtpJQg+B1v0hK9bJTZnMT0hgK5I1+Tn1IEAH6xvmD3VHc+tyGW+VXwd6VAKV
	 +cPRLJGFVOQReilsjWI3JBJC4+znQ3JreXYJO+3PV0CSNfLhNql+OH/N9X6HvYv5xv
	 tCqZn5VzJlaWJ9rTsANRvboLoOs3uW9DYsTihux091euWnV4+JoEsfv0aTGBXXmjeF
	 jN0tg2n2T/7XjDrbz2uHpzsaurE/pT1qX1U56muy66PBfBNqPttJvppMijbwypZKZz
	 9Th5Lyfn5NaRg==
Date: Fri, 18 Oct 2024 10:56:45 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Subject: RE: Usb IP Failing to connect depending of program being runned even
 when the connection talks are identical
To: Greg KH <gregkh@linuxfoundation.org>
References: <50f9a086-d873-44d2-bdda-a8e00dd2421e@startmail.com>
 <2024101824-shakable-portfolio-9cfb@gregkh>
From: Pixiae <pxiaegbayn@use.startmail.com>
Content-Language: en-US
Cc: linux-usb@vger.kernel.org
Reply-To: pxiaegbayn@use.startmail.com
Disposition-Notification-To: Pixiae <pxiaegbayn@use.startmail.com>
In-Reply-To: <2024101824-shakable-portfolio-9cfb@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Greg KH,


 > Why not just use the in-kernel device code instead of creating your own?

Do you mean that, why I don't write a kernel module?
If that is what you mean, I don't want to have to share the code of my 
device if I ever want to share my device, would be one reason.
Another is that I want it to be portable to multiple kernels, like 
the FreeBSD's kernel, even thought I would also have to write a USB IP 
implementation for the FreeBSD's kernel as looks so far they are missing 
it.

 > Is there something wrong with that implementation?

Could I know what implementation you refer to?

Cordially, Pixiae.


