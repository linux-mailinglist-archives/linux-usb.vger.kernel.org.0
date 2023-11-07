Return-Path: <linux-usb+bounces-2620-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0127E3574
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 08:03:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C0850B20C3C
	for <lists+linux-usb@lfdr.de>; Tue,  7 Nov 2023 07:03:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C8BC147;
	Tue,  7 Nov 2023 07:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0kjZWwCh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47145AD5D
	for <linux-usb@vger.kernel.org>; Tue,  7 Nov 2023 07:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14915C433C7;
	Tue,  7 Nov 2023 07:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699340579;
	bh=JDRGlM9lrsHUhV43a6D7wVaw0GwPSvbuJMm3TbmECDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0kjZWwChfUkzXoNI3F0xNtc+Hxuv7g98mWrYubOvkUH6fWwAeBIJcpNktzR7Aakl9
	 dUPzVJkP4xdUYhFSJ6ybb/rFX5zqT9/V/nQW5HkOzauL3MsfDkY3YmL3Pj9INU33Us
	 e1EtFqahjL0WXs5LHsi8XuoiBtMtfqc7TBImUTMQ=
Date: Tue, 7 Nov 2023 08:02:55 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Stanley =?utf-8?B?Q2hhbmdb5piM6IKy5b63XQ==?= <stanley_chang@realtek.com>
Cc: Vinod Koul <vkoul@kernel.org>, Johan Hovold <johan+linaro@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 0/3] Revert "usb: phy: add usb phy notify port status API"
Message-ID: <2023110713-morphine-mortuary-337e@gregkh>
References: <20231106110654.31090-1-johan+linaro@kernel.org>
 <2023110623-pointing-stump-643d@gregkh>
 <ZUjM/VEliT5c8H4C@matsya>
 <28e77cbc531248bf913ceedba6425cf6@realtek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <28e77cbc531248bf913ceedba6425cf6@realtek.com>

On Tue, Nov 07, 2023 at 06:44:26AM +0000, Stanley Chang[昌育德] wrote:
> Hi Johan and Vinod,
> 
> I modified the Realtek phy to solve this issue and only use the generic PHY.
> And submitted these patches today as follows
> https://lore.kernel.org/linux-usb/20231107063518.27824-1-stanley_chang@realtek.com/
> https://lore.kernel.org/linux-usb/20231107063518.27824-2-stanley_chang@realtek.com/
> https://lore.kernel.org/linux-usb/20231107063518.27824-3-stanley_chang@realtek.com/
> https://lore.kernel.org/linux-usb/20231107063518.27824-4-stanley_chang@realtek.com/
> 
> I don't think this patch is needed to revert a08799cf17c2 ("usb:phy: New usb phy notification port status API").

I had already applied those reverts yesterday, but forgot to push them
out (sorry about that, now fixed.)  Let's start over here and you can
rebase your new series on the 6.7-rc1.

thanks,

greg k-h

