Return-Path: <linux-usb+bounces-1755-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 506147CC94F
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 18:59:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 07831281963
	for <lists+linux-usb@lfdr.de>; Tue, 17 Oct 2023 16:59:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106B042BE8;
	Tue, 17 Oct 2023 16:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Nh7ljK+W"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C157405DE
	for <linux-usb@vger.kernel.org>; Tue, 17 Oct 2023 16:59:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B7C7C433C7;
	Tue, 17 Oct 2023 16:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697561944;
	bh=HIFjzyGO+NajS8Gg9vMNwoBgF+XbPjSMhySedDPzHPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nh7ljK+W3EUhDRulQpIpuIlvx6M+I8yExETk8PcVwsDG56J2pEwNYrZzq1IAYvRim
	 pAa5bxR7ZsK6V8onWb1lLzSMr6cQ7tDrNVbf0wjeTK1MVcCXbb7e5HLP1sQiYAou6w
	 fBBC8YfsHlgv121zbRhtymD2F9Y+eaKvKwMbCaQw=
Date: Tue, 17 Oct 2023 18:59:01 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Linux USB Mailing List <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: core: Minor improvements to
 usb_hub_create_port_device
Message-ID: <2023101726-popper-shortlist-4065@gregkh>
References: <4793f68e-cb16-4058-9704-230ae0e32b8e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4793f68e-cb16-4058-9704-230ae0e32b8e@gmail.com>

On Tue, Oct 17, 2023 at 06:43:51PM +0200, Heiner Kallweit wrote:
> Minor improvements, no functional change intended.
> - Use variable hdev instead of hub->hdev
> - Don't call hub_is_superspeed() twice
> - Style fix for else clause

Please do not do multiple things in the same patch.  These need to be
all broken up into "one patch per logical change" to be able to properly
review and potentially revert them in the future.

thanks,

greg k-h

