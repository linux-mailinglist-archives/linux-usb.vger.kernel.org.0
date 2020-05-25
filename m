Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AC191E113B
	for <lists+linux-usb@lfdr.de>; Mon, 25 May 2020 17:03:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390911AbgEYPDA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 May 2020 11:03:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:48240 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbgEYPDA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 25 May 2020 11:03:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 2C455AC9F;
        Mon, 25 May 2020 15:03:01 +0000 (UTC)
Message-ID: <1590418977.2838.16.camel@suse.com>
Subject: Re: ttyACM: disabled by hub (EMI?), re-enabling... Causes garbage
 chars & disconnect
From:   Oliver Neukum <oneukum@suse.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Mon, 25 May 2020 17:02:57 +0200
In-Reply-To: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
References: <6a4fe396ab5ae6cda548e904c57bc823103999d7.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 25.05.2020, 14:46 +0000 schrieb Joakim Tjernlund:

> This (EMI?) disconnect causes 2 things.
> 1) I loose the TTY temporarily and have to reconnect.

Unfortunately I see no way to reestablish contact transparantly
on the level of the driver.

> 2) After reconnect there are garbage chars on the gadget side, such as:
>      h�^@^@� ^@^@� ^@

This looks like MM is acting up in user space.

>    or
>      X���)H��4Ğ^���
>    which causes confusion on for the tty/bash on the gadget.
> 
> The disconnect is mostly just annoying but the garbage chars are a major pain, one cannot trust
> that cmds are understod. Is there a bug in ttyACM driver causing these?

Hi,

thanks for the bug report. The most likely cause of your problem is
ModemManager probing the new device. It has a blacklist.

	HTH
		Oliver

