Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF7CD9B813
	for <lists+linux-usb@lfdr.de>; Fri, 23 Aug 2019 23:23:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388911AbfHWVXS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Aug 2019 17:23:18 -0400
Received: from mx2.suse.de ([195.135.220.15]:39612 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388270AbfHWVXS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 23 Aug 2019 17:23:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id EB7E5B0B7;
        Fri, 23 Aug 2019 21:23:16 +0000 (UTC)
Message-ID: <1566595393.8347.56.camel@suse.com>
Subject: Re: Lacie Rugged USB3-FW does not work with UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     Julian Sikorski <belegdol@gmail.com>, linux-usb@vger.kernel.org
Date:   Fri, 23 Aug 2019 23:23:13 +0200
In-Reply-To: <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com>
References: <ffe7a644-bd56-3f3e-4673-f69f21f4132b@gmail.com>
         <1566567572.8347.54.camel@suse.com>
         <bedb5e9f-5332-4905-2237-347d7ea77447@gmail.com>
         <0eaecb64-4c67-110d-8493-31dd7fd58759@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 23.08.2019, 16:21 +0200 schrieb Julian Sikorski:
> 
> I did some further digging regarding whether this is a regression: the
> quirk file on the laptop is from 15 July 2014. The machine is from ca.
> May 2011. Looking through my earlier posts to linux-usb it appears that
> the addition of the quirk is related to this thread:
> 
> https://marc.info/?l=linux-usb&m=140537519907935&w=2
> 
> At the same time, back in 2011, I reported that the drive was working
> after some fixes:
> 
> https://marc.info/?l=linux-usb&m=132276407611433&w=2

Hi,

this is alarming. Was this physically the same drive? I am asking
because we have seen cases where two different devices were sold
under the same name.

	Regards
		Oliver

