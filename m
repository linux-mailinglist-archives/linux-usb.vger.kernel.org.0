Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC58821E8C6
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 09:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725931AbgGNHCO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Jul 2020 03:02:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:38198 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725853AbgGNHCN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 14 Jul 2020 03:02:13 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B747FB648;
        Tue, 14 Jul 2020 07:02:14 +0000 (UTC)
Message-ID: <1594710129.2541.15.camel@suse.de>
Subject: Re: [PATCH] cdc-acm: acm_init: Set initial BAUD to B0
From:   Oliver Neukum <oneukum@suse.de>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Tue, 14 Jul 2020 09:02:09 +0200
In-Reply-To: <0180a0cae3ff2772df0f6cea93739ae2deb52b24.camel@infinera.com>
References: <20200710093518.22272-1-joakim.tjernlund@infinera.com>
         <1594634939.2541.3.camel@suse.de>
         <0180a0cae3ff2772df0f6cea93739ae2deb52b24.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 13.07.2020, 20:26 +0000 schrieb Joakim Tjernlund:

Good morning,

> 
> OK, but it is strange that init_termios.c_cflag does not take/do
> anything unless I change order. Perhaps termios should move to probe
> instead?

Are you saying that the tty layer does not set termios when a new
tty is created? This looks strange to me and I do not want to paper
over a wider issue.

> Also, the handling of DTR came up. It seems to me that ACM
> deassert DTR until open time which is fine/good.

ACM does not really control DTR by itself. The earliest time
we can touch it would be probe. And again setting sane defaults
for DTR looks like a job for the tty layer.
acm_set_control() AFAICT does its job correctly.

> !DTR signals to the other end that ACM is not ready and don't
> want input but ACM still accepts input if received.
> 
> Would it make sense to actually enforce DTR locally too?
> If input is unwanted, don't accept any either.

This looks difficult. Basically we can call acm_set_control()
which will execute a control request. Yet there is inevitably
a race between setting such a control line and data getting in
and between clearing a control signal and data getting into the buffer.
We could stop reading once we are sure the control signal is
effective, but we have no operation for clearing the buffers
in the device. We cannot tell whether data in them is stale
in the sense of being accepted without DTR or newly arrived.

Could you make a concrete proposal of how to achieve this
short of a device reset? The mapping between CDC-ACM and
a physical RS-232 is only as good as the device makes it.
CDC-ACM is only secondarily a serial driver. The common
association between modems and serial devices is historical,
not technical.

	Regards
		Oliver

