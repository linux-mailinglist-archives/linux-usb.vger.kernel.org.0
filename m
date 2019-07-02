Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E137E5D332
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 17:43:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbfGBPng (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 11:43:36 -0400
Received: from mx2.suse.de ([195.135.220.15]:56454 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726252AbfGBPng (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 2 Jul 2019 11:43:36 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6821CBC40;
        Tue,  2 Jul 2019 15:43:33 +0000 (UTC)
Message-ID: <1562081352.5819.25.camel@suse.com>
Subject: Re: [PATCH] usb: storage: skip only when uas driver is loaded
From:   Oliver Neukum <oneukum@suse.com>
To:     JC Kuo <jckuo@nvidia.com>, Greg KH <gregkh@linuxfoundation.org>
Cc:     usb-storage@lists.one-eyed-alien.net, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org
Date:   Tue, 02 Jul 2019 17:29:12 +0200
In-Reply-To: <6e764566-d6f5-c064-cd4d-66261a238d8f@nvidia.com>
References: <20190701084848.32502-1-jckuo@nvidia.com>
         <20190701085248.GA28681@kroah.com>
         <8e8e8703-8620-b625-4917-bbb8d999caa4@nvidia.com>
         <20190702044249.GA694@kroah.com>
         <f6ed2505-5da9-c217-a052-a19d197c5c8e@nvidia.com>
         <f43e7ecf-64d5-20d2-0461-85a55fa28a33@nvidia.com>
         <1562058690.5819.9.camel@suse.com>
         <6e764566-d6f5-c064-cd4d-66261a238d8f@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 02.07.2019, 22:05 +0800 schrieb JC Kuo:

Hi,

> I don't see the uas issue myself. I was trying to describe a situation that
> user having issue with UAS storage and would like to blacklist uas module when
> the user is not aware of the usb-storage quirks parameter.
> 
> https://marc.info/?l=linux-usb&m=143385909823645&w=2

So we are not meeting the expectations of some users. Ideally we would.
Yet there are things we cannot do.

> UAS capable devices are backward-compatible with legacy Bulk-only protocol.
> Therefore, IMHO, ideally if system software doesn't have UAS support, system

Exact. At compilation time this is a valid consideration.

> software should enable the UAS device with Bulk-only protocol, unless
> usb-storage driver is not there as well.

What you could do, if we cannot change what the kernel does, is
improving documentation. We can at least tell users how it is done
correctly.

	Regards
		Oliver

