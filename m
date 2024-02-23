Return-Path: <linux-usb+bounces-6952-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8040D86106C
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 12:32:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1FF3B1F23072
	for <lists+linux-usb@lfdr.de>; Fri, 23 Feb 2024 11:32:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D49B277A05;
	Fri, 23 Feb 2024 11:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d+Yjx3Yk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5176F5C617
	for <linux-usb@vger.kernel.org>; Fri, 23 Feb 2024 11:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708687950; cv=none; b=dvGw+gX7XihyV7C7r4AxnvhdBuFiShBrKFfzpjU/gh+qffAXmRkhl834U+v58P3FD1uM1LgX9/34qnAgv8EvLNvw61jYk14IGBYv4l2xjVwWlg8untyJL454MOx0wvvASAUftkKys88P0GzF4uiON9oC1Kr7Lfi/equW+1a4Tk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708687950; c=relaxed/simple;
	bh=R0JLvxd88xCvuUm/IDFR4YEKRawn2JNsIrx0cGr7Nf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=onkh+N5KQQw+GCebXnpFvxe38go94I6ABb6+9zEA0ADB5DJMftlVhLbaLD/dEfDid2CdHD59/wW89YofZw37WuBYSK0giq4pqWjMcmGNQsB32vN565evcqCZSgQikKs2U/mRtqeZZQU16fFvdhbr7CH6f7LqZJKTG0KCMmYXJfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d+Yjx3Yk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98239C433C7;
	Fri, 23 Feb 2024 11:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708687950;
	bh=R0JLvxd88xCvuUm/IDFR4YEKRawn2JNsIrx0cGr7Nf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+Yjx3YkT7TNfMF/QztAJuefG+NtgyhjoI8svff0SyXptXab2dPnsD47EOgT5EvhM
	 3BbSBudFCBaXUjZBWwXYzVkICnbbiAUD0B2Q6qRv0Bl92GePeCxfUPgapgu6E8oIlA
	 RpIeut4VgvmXezKoeZWCgJhcZ+d+0cLVZKSmRySc=
Date: Fri, 23 Feb 2024 12:32:27 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Zijun Hu <quic_zijuhu@quicinc.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	usb-storage@lists.one-eyed-alien.net
Subject: Re: [PATCH] Bluetooth: btusb: Use right timeout macro to receive
 control message
Message-ID: <2024022318-tradition-pauper-798f@gregkh>
References: <1708682416-8664-1-git-send-email-quic_zijuhu@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1708682416-8664-1-git-send-email-quic_zijuhu@quicinc.com>

On Fri, Feb 23, 2024 at 06:00:16PM +0800, Zijun Hu wrote:
> USB driver defines macro @USB_CTRL_SET_TIMEOUT for sending control message
> and @USB_CTRL_GET_TIMEOUT for receiving, but sierra_get_swoc_info() wrongly
> uses @USB_CTRL_SET_TIMEOUT as argument of usb_control_msg() to receive
> control message, fixed by using @USB_CTRL_GET_TIMEOUT to receive message.
> 
> Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
> ---
>  drivers/usb/storage/sierra_ms.c | 2 +-

Your subject line is odd :(


