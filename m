Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3EBA2EABA8
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2019 09:39:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726922AbfJaIja (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Oct 2019 04:39:30 -0400
Received: from mx2.suse.de ([195.135.220.15]:42048 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726774AbfJaIja (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 31 Oct 2019 04:39:30 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 4BD67ACA4;
        Thu, 31 Oct 2019 08:39:28 +0000 (UTC)
Subject: Re: [PATCH v2] scsi: Fix scsi_get/set_resid() interface
To:     Bart Van Assche <bvanassche@acm.org>,
        Damien Le Moal <Damien.LeMoal@wdc.com>,
        "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
        "Martin K . Petersen" <martin.petersen@oracle.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>,
        Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Justin Piszcz <jpiszcz@lucidpixels.com>
References: <20191030090847.25650-1-damien.lemoal@wdc.com>
 <af516590-58dc-0377-5c54-ac63cffbafc8@acm.org>
 <BYAPR04MB5816D4B866F2E7CC421E8488E7600@BYAPR04MB5816.namprd04.prod.outlook.com>
 <a33afd2e-a7d6-5584-dc26-79fb8f3d6a97@acm.org>
From:   Hannes Reinecke <hare@suse.de>
Message-ID: <a640ee15-515b-6811-9883-48b49ead9276@suse.de>
Date:   Thu, 31 Oct 2019 09:39:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <a33afd2e-a7d6-5584-dc26-79fb8f3d6a97@acm.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/30/19 6:01 PM, Bart Van Assche wrote:
> On 10/30/19 9:21 AM, Damien Le Moal wrote:
>> If you feel strongly about it, I have absolutely no problem with
>> dropping the patch. I just would like that it be dropped for the right
>> reasons...
> 
> Hi Damien,
> 
> What I'm wondering about is how the SCSI core should support residual
> overflow. Should a new member be introduced in struct scsi_request?
> Should resid_len be changed from unsigned int to int or should we
> perhaps follow yet another approach?
> 
Please introduce a new member to hold any overflow value.
And document where it is needed.

Cheers,

Hannes
-- 
Dr. Hannes Reinecke            Teamlead Storage & Networking
hare@suse.de                              +49 911 74053 688
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 Nürnberg
GF: Felix Imendörffer, Mary Higgins, Sri Rasiah
HRB 21284 (AG Nürnberg)
