Return-Path: <linux-usb+bounces-2132-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D6D307D56D2
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 17:44:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 121041C20C6B
	for <lists+linux-usb@lfdr.de>; Tue, 24 Oct 2023 15:44:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52C5237CB1;
	Tue, 24 Oct 2023 15:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C8937CAF
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 15:44:22 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id 62BB6BA
	for <linux-usb@vger.kernel.org>; Tue, 24 Oct 2023 08:44:20 -0700 (PDT)
Received: (qmail 461325 invoked by uid 1000); 24 Oct 2023 11:44:19 -0400
Date: Tue, 24 Oct 2023 11:44:19 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Hardik Gajjar <hgajjar@de.adit-jv.com>
Cc: Greg KH <gregkh@linuxfoundation.org>, mathias.nyman@intel.com,
  yangyingliang@huawei.com, jinpu.wang@ionos.com, linux-usb@vger.kernel.org,
  linux-kernel@vger.kernel.org, erosca@de.adit-jv.com
Subject: Re: [PATCH v4] usb: core: hub: Add quirks for reducing device
 address timeout
Message-ID: <de2ed64a-363a-464c-95be-584ce1a7a4ad@rowland.harvard.edu>
References: <2023101155-unframed-satirical-f7ec@gregkh>
 <20231011164525.97616-1-hgajjar@de.adit-jv.com>
 <2023101620-shaky-sensitize-9708@gregkh>
 <20231017161021.GA62775@vmlxhi-118.adit-jv.com>
 <2023101750-bless-humorous-45c7@gregkh>
 <6c25beed-06fe-4be0-b51a-18e159d25072@rowland.harvard.edu>
 <2023102105-attribute-pajamas-a0dc@gregkh>
 <20231023161348.GA55951@vmlxhi-118.adit-jv.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023161348.GA55951@vmlxhi-118.adit-jv.com>

On Mon, Oct 23, 2023 at 06:13:48PM +0200, Hardik Gajjar wrote:
> On Sat, Oct 21, 2023 at 12:15:35PM +0200, Greg KH wrote:
> > On Tue, Oct 17, 2023 at 02:59:54PM -0400, Alan Stern wrote:
> > > On Tue, Oct 17, 2023 at 06:53:44PM +0200, Greg KH wrote:
> > > > On Tue, Oct 17, 2023 at 06:10:21PM +0200, Hardik Gajjar wrote:
> > > > > More logs and detailed in patch V1:
> > > > > https://urldefense.proofpoint.com/v2/url?u=https-3A__lore.kernel.org_linux-2Dusb_20230818092353.124658-2D1-2Dhgajjar-40de.adit-2Djv.com_T_-23m452ec9dad94e8181fdb050cd29483dd89437f7c1&d=DwICAg&c=euGZstcaTDllvimEN8b7jXrwqOf-v5A_CdpgnVfiiMM&r=SAhjP5GOmrADp1v_EE5jWoSuMlYCIt9gKduw-DCBPLs&m=P0HXZTx6ta7v5M4y2Y7WZkPrY-dpKkxBq8tAzuX8cI9aj9tE2NuVvJjLl3Uvojpw&s=N_HwnQeZb_gHMmgz53uTGDUZVi28EXb1l9Pg6PdbvVI&e=
> > > > > > 
> > > > > > > Achieving this is impossible in scenarios where the set_address is
> > > > > > > not successful and waits for a timeout.
> > > > > > 
> > > > > > Agreed, broken hardware is a pain, but if your device is allowed to take
> > > > > > longer, it can, and will, so you have to support that.
> > > > > > 
> > > > > The problem is not caused by the device taking an extended amount of time to
> > > > > process the 'set_address' request. Instead, the issue lies in the absence of
> > > > > any activity on the upstream bus until a timeout occurs.
> > > > 
> > > > So, a broken device.  Why are you then adding the hub to the quirk list
> > > > and not the broken device?  We are used to adding broken devices to
> > > > qurik lists all the time, this shouldn't be new.
> > > 
> > > Adding a quirk for the device isn't feasible, because the problem occurs 
> > > before the device has been initialized and enumerated.  The kernel 
> > > doesn't know anything about the device at this point; only that it has 
> > > just connected.
> > 
> > Ah, ick, you are right, but we do know the "broken hub" id, so that
> > makes a bit more sense.  Should this be a hub-only type quirk?
> 
> In addition to the earlier comment, it appears that the issue is most likely
> related to the hub. While we have identified one specific phone that triggers
> this problem, we cannot determine how many other devices might encounter a
> similar issue, where they enumerate as full speed initially and then switch
> to high speed. To address this, we are proposing to use a 500 ms timeout for
> all devices connected via the hub. This change aims to prevent potential
> timeout-related problems with various devices

So it sounds like the best approach is to make this a hub-specific 
quirk.

> It does appear that the issue is related to the hub, and the ideal solution would involve
> modifying the hub's firmware. However, implementing such a firmware fix is currently not
> a straightforward task. As a result, we have implemented this quirk-based solution to
> mitigate the issue to some extent
> 
> Following is the LeCroy analyzer logs:
> 
> 1. logs between Hub and phone with broken hub.
> 
> In packet 58, there is a Full-speed J (suspend) event that lasted for 5.347 seconds.
> It's suspected that the hub was suspended due to incorrect chirp parsing.
> This anomaly in chirp parsing may be a contributing factor to the issue we're facing.

Yes, that's probably true.  It's another indication that the hub is 
somehow at fault.

Alan Stern

