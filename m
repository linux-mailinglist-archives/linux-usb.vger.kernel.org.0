Return-Path: <linux-usb+bounces-5237-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FF4831F92
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 20:22:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 730051F284CB
	for <lists+linux-usb@lfdr.de>; Thu, 18 Jan 2024 19:22:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9C432E3F5;
	Thu, 18 Jan 2024 19:22:01 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id D005F2E41A
	for <linux-usb@vger.kernel.org>; Thu, 18 Jan 2024 19:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.131.102.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705605721; cv=none; b=Cyc7YO2YTxgvHQZYCMb1hymVR5mjHf/WPooBJIYd042WQF8zAWqkNs5aKUbFy9ksVlDjfIlJbG/F0ZKJYaLqNZCZrd9gY0v/kGdCIFhySuGwwrNOZ4jfnBOiQjqfoQER8NzzartDLxCox4MIMvM1g9c3gU7ldsCnqDIhz4dDhnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705605721; c=relaxed/simple;
	bh=jGsMAld38lJ04wMdX0XkmAx3zDzSdsdVXcP5KeXSuKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HqQqq1QM0SSK0F0qs/QQ0zsHEFNhmKZ1+nZ/eKTXOcj0YJRoLYa6360vwF/KWmkG/aSCNsTcJnqiSy8CP5VQaVsBuqXkMi9oD+NHU6ZoYl7YepWou9Nzm91t+DCY4pV0HGJXi1Rf9KF/nH5ico/uhRpIi2EzdF4cw4sZKM72nNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu; spf=pass smtp.mailfrom=netrider.rowland.org; arc=none smtp.client-ip=192.131.102.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netrider.rowland.org
Received: (qmail 15070 invoked by uid 1000); 18 Jan 2024 14:21:57 -0500
Date: Thu, 18 Jan 2024 14:21:57 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: Greg KH <gregkh@linuxfoundation.org>,
  Heikki Krogerus <heikki.krogerus@linux.intel.com>,
  "benjamin.tissoires@redhat.com" <benjamin.tissoires@redhat.com>,
  "hdegoede@redhat.com" <hdegoede@redhat.com>,
  "ivan.orlov0322@gmail.com" <ivan.orlov0322@gmail.com>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
  dl-linux-imx <linux-imx@nxp.com>, Jun Li <jun.li@nxp.com>
Subject: Re: [EXT] Re: [PATCH] usb: roles: try to get/put all relevant modules
Message-ID: <e65ecd23-004a-45f3-aff4-ab2a51c34962@rowland.harvard.edu>
References: <b1edb397-c06d-4112-b2ed-713e213ac751@rowland.harvard.edu>
 <DU2PR04MB8822E96E3AFF2EBB587B73BA8C732@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <d8f379d2-82ee-4567-8323-961cea5fd095@rowland.harvard.edu>
 <DU2PR04MB8822149F7BBDDD0B59ECDE918C722@DU2PR04MB8822.eurprd04.prod.outlook.com>
 <ZajtviC5hDVEczBN@kuha.fi.intel.com>
 <2024011801-chewer-coastline-a16f@gregkh>
 <Zakb4lHpiS7ty+aF@kuha.fi.intel.com>
 <2024011842-harpist-password-b965@gregkh>
 <0f386d9a-b375-472b-8054-beb142916faf@rowland.harvard.edu>
 <DU2PR04MB88220905301520363CD1566F8C712@DU2PR04MB8822.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DU2PR04MB88220905301520363CD1566F8C712@DU2PR04MB8822.eurprd04.prod.outlook.com>

On Thu, Jan 18, 2024 at 03:52:52PM +0000, Xu Yang wrote:
> I've tried your suggestion and it appears to be working fine. Now I'm not sure if
> the module get/put parts should be removed or to fix the NULL pointer issue. I'm
> working on this issue, so I have time to fix it. I think if first way is taken, the status
> of usb_role_switch device should be updated when it's registered/unregisterd. Or
> other issues will occur since the user doesn't know the change of usb_role_switch
> device.

These really are questions for Heikki, not me.  Can you at least show us 
the patch you've been testing?

I agree that the status of the current USB role should be exposed to 
userspace somehow.

Alan Stern

