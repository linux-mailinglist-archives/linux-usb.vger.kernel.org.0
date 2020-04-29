Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1BDCD1BD810
	for <lists+linux-usb@lfdr.de>; Wed, 29 Apr 2020 11:20:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726366AbgD2JUH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Apr 2020 05:20:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:34590 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726345AbgD2JUG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 29 Apr 2020 05:20:06 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 18C11AF69;
        Wed, 29 Apr 2020 09:20:05 +0000 (UTC)
Message-ID: <1588151982.8672.0.camel@suse.com>
Subject: Re: unusual_uas.h additional entry
From:   Oliver Neukum <oneukum@suse.com>
To:     Julian =?ISO-8859-1?Q?Gro=DF?= <julian.g@posteo.de>,
        hdegoede@redhat.co
Cc:     linux-usb@vger.kernel.org
Date:   Wed, 29 Apr 2020 11:19:42 +0200
In-Reply-To: <20200428212701.2ee42662@motofckr9k-mint-desktop>
References: <20200428212701.2ee42662@motofckr9k-mint-desktop>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Dienstag, den 28.04.2020, 21:27 +0200 schrieb Julian Groß:
> Hello,
> 
> I would like to ask for an addition to the "unusual_uas.h" file.
> According to
> https://en.opensuse.org/SDB:USB_3.0_Hard_Drive_troubleshooting I went
> through the usb_stor_adjust_quirks flags for my USB 3.0 storage device
> and found flag "f" to fix my issue of the device needing several
> minutes to connect (flag "u" of couse also fixing the issue).
> 
> As I don't understand the format of the entries, please add missing
> information from the "lsusb -v" output down below.

Hi,

done. Thank you for the report. You have improved the kernel.

	Regards
		Oliver
