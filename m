Return-Path: <linux-usb+bounces-506-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DADD87AAD80
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 11:12:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 7DF6B1C20AA1
	for <lists+linux-usb@lfdr.de>; Fri, 22 Sep 2023 09:12:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC33D17733;
	Fri, 22 Sep 2023 09:12:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BCB6109
	for <linux-usb@vger.kernel.org>; Fri, 22 Sep 2023 09:12:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EFBCC433C7;
	Fri, 22 Sep 2023 09:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1695373953;
	bh=x+1imNNqHjvPUOZH/YRz3+TAXYo2Skow/DDIECDPgxM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rIMa3dO3AQAV5blmnhni1NBRxUN4Vhm6csbf+J6YTZ3kAGPNC/ekW+k39bVVzU5gX
	 +J5s04QnR+6FZjQpmaHDrUIyeO9UbMjdWspM/iR3RCAb1eAL1KPw302G2JLB9f1jno
	 srbvCD7n21TtUJZU2fNCAdhyLzLzez3vnekDW2CQ=
Date: Fri, 22 Sep 2023 11:12:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
Cc: stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
	linux@roeck-us.net, kernel@collabora.com
Subject: Re: [PATCH] usb: hub: Guard against accesses to uninitialized BOS
 descriptors
Message-ID: <2023092229-fall-transform-4664@gregkh>
References: <20230830100418.1952143-1-ricardo.canuelo@collabora.com>
 <2023083007-vowed-latitude-acef@gregkh>
 <87cyz4hjzq.fsf@collabora.com>
 <2023083048-armrest-subtype-9b6b@gregkh>
 <87bkduepf3.fsf@collabora.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bkduepf3.fsf@collabora.com>

On Fri, Sep 22, 2023 at 07:40:32AM +0200, Ricardo Cañuelo wrote:
> Hi,
> 
> On mié, ago 30 2023 at 13:12:03, Greg KH <gregkh@linuxfoundation.org> wrote:
> > As all of these are older than the oldest supported LTS kernel, we
> > should be fine in taking it all the way back to 4.14.y then.
> >
> > I'll queue this up after 6.6-rc1 is out, thanks.
> 
> Gentle ping, what's the merge status of this patch? I haven't seen it on
> -next yet.

Please relax, it was the merge window and then I have been traveling for
conferences.  If you wish to have patches applied sooner, please help
out in reviewing the other outstanding patches on the mailing list to
provide help to reduce the overall load.

thanks,

greg k-h

