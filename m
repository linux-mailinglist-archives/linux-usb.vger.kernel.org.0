Return-Path: <linux-usb+bounces-12310-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9EC93881D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 06:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2BD59B20D97
	for <lists+linux-usb@lfdr.de>; Mon, 22 Jul 2024 04:48:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D5F9168BE;
	Mon, 22 Jul 2024 04:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QTJDsDKB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9383C802
	for <linux-usb@vger.kernel.org>; Mon, 22 Jul 2024 04:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721623726; cv=none; b=B+gKcTSW9BChtMRPhADMBAB8qM7YNEhtcly3Tl7PI3UvcOK+gIxc709/vek1xDlN1MrWM/uaeYt2wohkrqYydH/ABX4bqr7cYxn9QgF0nro2Jya2uL0k0ErWD96hkVYFkLi79yF3RtklLznrkCtxuRHCD8af/Wl987t0R+VC1Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721623726; c=relaxed/simple;
	bh=N2oxKEOiBg0PbXjTswL7rcfjqzyG1VcHKUrl7JU5Lf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gsQway0Gs/s9n7PPMgejLLCNZllhpGtEveMJlb2HfmZz8q+fH4DdBUQuJGdZYosBq/h1RtgShQSOQiiGvHh8wjZ2RMeHR2x1OUDFfjdD2kvk9tToARzpsKPdb9OyRoOuGX4el93Y3CglFY5VAP5fsVFxlycHPvIGcH2bVwqxhE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QTJDsDKB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA9A2C116B1;
	Mon, 22 Jul 2024 04:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1721623726;
	bh=N2oxKEOiBg0PbXjTswL7rcfjqzyG1VcHKUrl7JU5Lf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QTJDsDKBCPxAb0x3jLnfnmKgDKymbWPxtNFeEpicLbvla4V6M/ZD8SYuvDKqWEHCd
	 03YSsvL/1FYRQ9AKJKKzGEWd0E9QEwZ1tE2LOkwnVpN0ITjeEdMWNIAeceP1VGSnHE
	 OTS1+3Ulsyq0rVQT9qVqTMy/5EtrUIcBuUbMxaCQ=
Date: Mon, 22 Jul 2024 06:48:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: G4bandit@mail.de
Cc: linux-usb@vger.kernel.org
Subject: Re: cp210x VID and PID of my device are missing allthough the should
 be there
Message-ID: <2024072207-overstay-counting-8e61@gregkh>
References: <fbde5b4b-6640-4cc9-b39a-7eafcc0d29ba@mail.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fbde5b4b-6640-4cc9-b39a-7eafcc0d29ba@mail.de>

On Sun, Jul 21, 2024 at 08:09:12PM +0200, G4bandit@mail.de wrote:
> 
> Hi
> my device with the
> VID = 0x28e9
> PID = 0x028a
> should be supported by the cp210x driver. But in fact this VID and PID does
> not appear.

Why do you think this driver should support this device?

> See the output:
> alias:          usb:v3195pF190d*dc*dsc*dp*ic*isc*ip*in*
> alias:          usb:v2626pEA60d*dc*dsc*dp*ic*isc*ip*in*
> alias:          usb:v2184p0030d*dc*dsc*dp*ic*isc*ip*in*
> alias:          usb:v1FB9p0701d*dc*dsc*dp*ic*isc*ip*in*
> 
> The manufacturer recommends to use the driver maintained in the linux
> kernels.

Which driver exactly?  Do you have a link to that recommendation?

thanks,

greg k-h

