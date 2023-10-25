Return-Path: <linux-usb+bounces-2178-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 806B97D6EB1
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 16:28:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B1ED01C20DE9
	for <lists+linux-usb@lfdr.de>; Wed, 25 Oct 2023 14:28:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A732AB31;
	Wed, 25 Oct 2023 14:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 988EC29432
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 14:28:43 +0000 (UTC)
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by lindbergh.monkeyblade.net (Postfix) with SMTP id E483018D
	for <linux-usb@vger.kernel.org>; Wed, 25 Oct 2023 07:28:41 -0700 (PDT)
Received: (qmail 495484 invoked by uid 1000); 25 Oct 2023 10:28:41 -0400
Date: Wed, 25 Oct 2023 10:28:41 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
  "Li, Meng" <Meng.Li@windriver.com>,
  "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
  "usb-storage@lists.one-eyed-alien.net" <usb-storage@lists.one-eyed-alien.net>,
  "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] usb: storage: add shutdown function for usb storage
 driver
Message-ID: <8ed3dd57-120a-49d2-817b-504d2f5523fc@rowland.harvard.edu>
References: <20231023054111.2744872-1-Meng.Li@windriver.com>
 <33bd0779-bfe7-4c87-8fe6-ea8455df3b6b@rowland.harvard.edu>
 <PH0PR11MB51918DD50651DB6BE937BEA3F1DFA@PH0PR11MB5191.namprd11.prod.outlook.com>
 <3fe5b43c-a5aa-4c6a-8614-03a4d9dd53e2@rowland.harvard.edu>
 <2023102428-zit-quickness-9b73@gregkh>
 <5107f6ca-e972-4af1-a21d-6c95778969f3@rowland.harvard.edu>
 <2023102459-protector-frequency-1033@gregkh>
 <a6bb88cd-0b89-4eb1-b90d-8ad633b7a8f2@rowland.harvard.edu>
 <bdac114d-2366-407a-bfe1-fca2bb035429@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdac114d-2366-407a-bfe1-fca2bb035429@suse.com>

On Wed, Oct 25, 2023 at 11:07:07AM +0200, Oliver Neukum wrote:
> On 24.10.23 21:23, Alan Stern wrote:
> > Since USB class-device drivers don't have ->shutdown callbacks (there is
> > no shutdown() method in struct usb_driver), they don't know what's going
> > on while a shutdown or reboot is in progress.  All they see is a bunch
> > of errors.
> 
> Does this solve the issue? You'd have to flush the cache on the SCSI
> device further down in the tree, if you want this done properly.

Depends on what issue you're talking about.  The purpose of the proposed 
patch was not to make sure that the reboot happens cleanly; it was to 
prevent certain error messages from showing up in the system log.

Besides, Meng Li has decided to withdraw the patch submission.

Alan Stern

