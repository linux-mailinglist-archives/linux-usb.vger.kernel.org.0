Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D8252138DEE
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 10:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgAMJlA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 04:41:00 -0500
Received: from mx2.suse.de ([195.135.220.15]:52184 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbgAMJlA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Jan 2020 04:41:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 1F908B19D;
        Mon, 13 Jan 2020 09:40:59 +0000 (UTC)
Message-ID: <1578907421.2590.2.camel@suse.com>
Subject: Re: Usb midi device does not work on wake
From:   Oliver Neukum <oneukum@suse.com>
To:     Richard Dodd <richard.o.dodd@gmail.com>, linux-usb@vger.kernel.org
Date:   Mon, 13 Jan 2020 10:23:41 +0100
In-Reply-To: <CAAWug1d8wv3Thu0b==j6fLajU965unYKs552j+s9t13MOytmng@mail.gmail.com>
References: <CAAWug1d8wv3Thu0b==j6fLajU965unYKs552j+s9t13MOytmng@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Sonntag, den 12.01.2020, 12:06 +0000 schrieb Richard Dodd:
> Hello
> 
> I've got a Novation midi-over-usb device (LaunchControl XL) that works
> correctly on boot, but remains in power-off mode when waking from
> sleep.
> 
> I suspect that there is some sort of initialisation that needs to be
> applied. Could anyone suggest possible causes, or point me in the
> direction of the relevant source code. I found `sound/usb/quirks.c`,
> which seems to be the place to handle this kind of thing, but there is
> no mention of my device anywhere in the source tree at present
> (1235:0061).

Hi,

some devices need an additional reset. They have the quirk RESET_RESUME
in that file. Try adding your device to that list and recompile your
kernel.

	HTH
		Oliver

