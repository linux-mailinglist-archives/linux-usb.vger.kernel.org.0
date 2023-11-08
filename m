Return-Path: <linux-usb+bounces-2681-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 546B27E532A
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 11:15:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D7D99B20D8B
	for <lists+linux-usb@lfdr.de>; Wed,  8 Nov 2023 10:15:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C48ED10A15;
	Wed,  8 Nov 2023 10:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+DiYp9s"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2083A10953
	for <linux-usb@vger.kernel.org>; Wed,  8 Nov 2023 10:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BDA2C433C7;
	Wed,  8 Nov 2023 10:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699438501;
	bh=Hj9x40ONDh0+AM7KopE8lAFnZbwCDvSvfpHcxcASXx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+DiYp9s/DKY59q2XlZb+/4AjuCNbgCe2J32meUOFyNd6QV+wkK6kvzO17mPZKcb4
	 rdmrWStdMqoHVjhnXHqoDzDcRaUIgrIMSFnKKELWxMCsEQ0q+ZMI/JiGkUNIC+blJY
	 ZcXJqkxa+mhikgNEJ4+ZYbBCQIeTewnAiAJWj/bzXsykWglLyy49gqKunxD5MzMXxo
	 SVM5cHQ5ctCVu04RgXddQVi/TGgMMp83yluwteAFrFSb6oXvtZ3/7zvikhY1PQ4m/O
	 68BokM1gmdamwDSWyK76HAv02PZZdd5tENnnBg1MlKKyOIWWT2l+NsFMX4V7/Ru775
	 vR839Q0UJyXRg==
Received: from johan by xi.lan with local (Exim 4.96)
	(envelope-from <johan@kernel.org>)
	id 1r0fbE-0007D6-23;
	Wed, 08 Nov 2023 11:15:52 +0100
Date: Wed, 8 Nov 2023 11:15:52 +0100
From: Johan Hovold <johan@kernel.org>
To: Victor Fragoso <victorffs@hotmail.com>
Cc: "larsm17@gmail.com" <larsm17@gmail.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] USB: serial: option: add Fibocom L7xx modules
Message-ID: <ZUtf2CyQWY0RP0HK@hovoldconsulting.com>
References: <9315051ae981aaad1d46724641defc6e5f79d12b.camel@hotmail.com>
 <84a78bb8-fd85-4ee5-9c92-859e8450a587@gmail.com>
 <94477736e69cc76eaaef8584d7e1aa5078a0611e.camel@hotmail.com>
 <103aa944-073a-4dd0-8d58-8c9123dc2352@gmail.com>
 <e56d75116d36eee749439f8d0a1b8ca4f7ce1445.camel@hotmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e56d75116d36eee749439f8d0a1b8ca4f7ce1445.camel@hotmail.com>

On Tue, Nov 07, 2023 at 10:02:28PM +0000, Victor Fragoso wrote:
> On Sat, 2023-10-28 at 02:59 +0700, Lars Melin wrote:

> > Johan may have a different opinion from mine and he is the one to 
> > decide, my take is that there is no value in having a minor part of the 
> > list grouped by mfgr and the major part of the list sorted by USB Id.
> > We have also seen in the past that when a mfgr1 buys a chipset from 
> > mfgr2 and then sells his product with mfgr2 Id instead of using one of 
> > his own Id's then there is also not uncommon that mfgr3 is also buying 
> > the same chipset without changing Id. Hence "Manufacturer name" is not 
> > unique but the vid is..
> > 
> > The list should not be seen or used as a cross reference between 
> > mfgr:product name and vid:pid, anyone who needs to search the driver 
> > source to see if a device is supported ought to know its vid:pid so can 
> > search on those and that works much better if the list is sorted by 
> > vid:pid in ascending order. Personally I'd rather see a source without 
> > all the unnecessary defines, only vid:pid based and with the 
> > mfgr/product as an optional comment.
> > 
> > When adding Id's to the driver it is you who should know the devices you 
> > are adding, don't add Id's if you have not personally confirmed their 
> > interface composition and usage.
> > Those who told you add these Id's apparently also told you that there 
> > are two versions of 2cb7:0001, one with ECM interfaces and one with 
> > RNDIS interfaces but your usb-devices output show both to be identical.. 
> > There is no RNDIS interface in your listings, both of them will load
> > the cdc_ether driver.

> Lars, understood. Your point makes sense and I could accept it with no
> problems.
> 
> Johan, can you please share your opinion to decide?

I fully agree with Lars here.
 
> 1- Should I create a new commit inserting the PID grouped among to
> Fibocom's VID? Or separately on Fibocom's VID section and another one
> on ZTE's VID section?

So as Lars suggested, try to keep the list sorted by VID / PID (i.e.
split them up).

> 2- Should I remove the generic Fibocom product comment and add just the
> product/mode that I could test it? e.g. Fibocom L716-EU (ECM)

Yes, please do that.

Johan

