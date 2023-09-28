Return-Path: <linux-usb+bounces-702-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 724157B1C29
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 14:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id 7CD44282475
	for <lists+linux-usb@lfdr.de>; Thu, 28 Sep 2023 12:24:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0075838BD1;
	Thu, 28 Sep 2023 12:24:56 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4FD38BC0
	for <linux-usb@vger.kernel.org>; Thu, 28 Sep 2023 12:24:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADA6BC433C8;
	Thu, 28 Sep 2023 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695903895;
	bh=VdQJXoutEQpOtTd+m9BGJ50ShPHnlgq7hEcgGVkkVJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KsF+2Dk90ZaJcFShmmixw3CC1NX18AJeE26vsX6jUAdO2xNppEUBABp2KAp9aJ9Ml
	 Vj1Y7PoT4ODACUjSakeLq1zVMkhUWZOS212vKElbqhEaERGixaIlwgMqoIWbW4iR2P
	 Be4E8CDjKdXwzaNuWxoiv4oktIieFqmVbxdwPGSc=
Date: Thu, 28 Sep 2023 14:24:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Oliver Neukum <oneukum@suse.com>, Wentong Wu <wentong.wu@intel.com>,
	arnd@arndb.de, mka@chromium.org, lee@kernel.org, wsa@kernel.org,
	kfting@nuvoton.com, broonie@kernel.org, linus.walleij@linaro.org,
	maz@kernel.org, brgl@bgdev.pl, linux-usb@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-gpio@vger.kernel.org, andriy.shevchenko@linux.intel.com,
	heikki.krogerus@linux.intel.com, andi.shyti@linux.intel.com,
	sakari.ailus@linux.intel.com, bartosz.golaszewski@linaro.org,
	srinivas.pandruvada@intel.com, zhifeng.wang@intel.com
Subject: Re: [PATCH v19 0/4] Add Intel LJCA device driver
Message-ID: <2023092850-alumni-flanking-77d6@gregkh>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <2023091704-nape-coconut-af6c@gregkh>
 <f576c346-db6c-dded-1502-c87d5e58fa39@redhat.com>
 <95ce1e2f-eb60-46fc-bced-06b8a150cbfb@suse.com>
 <1e7c1c28-5bbe-49b5-f5ff-8cc84039f34f@redhat.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1e7c1c28-5bbe-49b5-f5ff-8cc84039f34f@redhat.com>

On Thu, Sep 28, 2023 at 02:20:04PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 9/28/23 12:18, Oliver Neukum wrote:
> > On 17.09.23 13:26, Hans de Goede wrote:
> >  
> >> Note I did not ask for a new version to be send right away, but
> >> I'm afraid there has been a bit of miscommunication and instead
> >> of rebasing the next version based on further review Wentong has
> >> send out a new rebased version immediately, sorry about that.
> > 
> > Hi,
> > 
> > what to do now? It's been ten days.
> > I am sure this driver has been very thoroughly reviewed by now.
> > We are dragging this out. Do we want the developer to do another release
> > or do we ask Greg to take it as is?
> > This is becoming almost comical, but that is not what we want driver
> > submission to be.
> > 
> > As far as I am concerned on the USB side everything is fine now.
> > Hans? Greg?
> 
> Note I have been mostly involved in testing these patches I have
> *not* thoroughly reviewed them. I have taken a quick(ish) look
> which did not find anything obviously wrong.
> 
> I agree that at least patch 1/4 is ready for merging. I'm
> not sure if Greg should pick-up the entire series or if
> the rest should be merged through there relevant subsystems
> to also give the relevant subsys maintainer tree.
> 
> For the series:
> 
> Acked-by: Hans de Goede <hdegoede@redhat.com>
> Tested-by: Hans de Goede <hdegoede@redhat.com>

Ok, I'll take a look at these again next week when I return home and
catch up on my pending patch review queue.

thanks for the review!

greg k-h

