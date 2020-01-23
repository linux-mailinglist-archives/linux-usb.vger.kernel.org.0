Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40BA5146271
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2020 08:19:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726188AbgAWHT3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jan 2020 02:19:29 -0500
Received: from mx2.suse.de ([195.135.220.15]:48900 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726143AbgAWHT3 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 23 Jan 2020 02:19:29 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 6793EAEE7;
        Thu, 23 Jan 2020 07:19:27 +0000 (UTC)
Message-ID: <1579762922.2841.0.camel@suse.com>
Subject: Re: [PATCH v2] usb: uas: fix a plug & unplug racing
From:   Oliver Neukum <oneukum@suse.com>
To:     EJ Hsu <ejh@nvidia.com>
Cc:     linux-usb@vger.kernel.org
Date:   Thu, 23 Jan 2020 08:02:02 +0100
In-Reply-To: <20200122074302.69790-1-ejh@nvidia.com>
References: <20200122074302.69790-1-ejh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 21.01.2020, 23:43 -0800 schrieb EJ Hsu:
> When a uas disk is plugged into an external hub, uas_probe()
> will be called by the hub thread to do the probe. It will
> first create a SCSI host and then do the scan for this host.
> During the scan, it will probe the LUN using SCSI INQUERY command
> which will be packed in the URB and submitted to uas disk.
> 
> There might be a chance that this external hub with uas disk
> attached is unplugged during the scan. In this case, uas driver
> will fail to submit the URB (due to the NOTATTACHED state of uas
> device) and try to put this SCSI command back to request queue
> waiting for next chance to run.
> 
> In normal case, this cycle will terminate when hub thread gets
> disconnection event and calls into uas_disconnect() accordingly.
> But in this case, uas_disconnect() will not be called because
> hub thread of external hub gets stuck waiting for the completion
> of this SCSI command. A deadlock happened.
> 
> In this fix, uas will call scsi_scan_host() asynchronously to
> avoid the blocking of hub thread.
> 
> Signed-off-by: EJ Hsu <ejh@nvidia.com>
Acked-by: Oliver Neukum <oneukum@suse.com>

