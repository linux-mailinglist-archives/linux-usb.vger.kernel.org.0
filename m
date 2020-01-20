Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6CB0142775
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2020 10:38:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726148AbgATJii (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jan 2020 04:38:38 -0500
Received: from mx2.suse.de ([195.135.220.15]:54912 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725872AbgATJii (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 20 Jan 2020 04:38:38 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 39971ABB3;
        Mon, 20 Jan 2020 09:38:36 +0000 (UTC)
Message-ID: <1579513114.17973.13.camel@suse.com>
Subject: Re: [PATCH] usb: uas: fix a plug & unplug racing
From:   Oliver Neukum <oneukum@suse.com>
To:     EJ Hsu <ejh@nvidia.com>, Alan Stern <stern@rowland.harvard.edu>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Mon, 20 Jan 2020 10:38:34 +0100
In-Reply-To: <MN2PR12MB41262435500D3FC463DBFC32CF370@MN2PR12MB4126.namprd12.prod.outlook.com>
References: <Pine.LNX.4.44L0.2001140956040.1593-100000@iolanthe.rowland.org>
         <1579080683.15925.24.camel@suse.com>
         <MN2PR12MB41262435500D3FC463DBFC32CF370@MN2PR12MB4126.namprd12.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 15.01.2020, 15:54 +0000 schrieb EJ Hsu:

Hi,

> That's another reason why I would like to run scsi_scan_host() asynchronously
> and keep the hub thread free.

Very well. I must say I don't like it, but I have no good alternative.

> > > In my opinion, if scsi_scan_host() will be run asynchronously, this 
> > > interface needs to be guarded against runtime PM between uas_probe() & uas_scan_work().
> > 
> > Yes it does. But it has a child, the SCSI host, which has an elevated count. It is already guarded.
> 
> I just checked the code, and the reference count will be incremented in scsi_scan_host(), 
> precisely speaking, in scsi_autopm_get_host().
> So, I still think we need to manually add reference count of interface here.
> Please correct me if there is anything wrong.

AFAICT the generic power model will not suspend a parent while a child
is active. The includes SCSI children of USB parents. So I think we are
safe. Could you resubmit your patch without the PM counter manipulation
and we can fix any issue that may exist in theory later?

	Regards
		Oliver

