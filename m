Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B22D1139316
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jan 2020 15:05:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728765AbgAMOF6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jan 2020 09:05:58 -0500
Received: from mx2.suse.de ([195.135.220.15]:55862 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726943AbgAMOF6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 13 Jan 2020 09:05:58 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 59F02B031;
        Mon, 13 Jan 2020 14:05:57 +0000 (UTC)
Message-ID: <1578923319.2590.13.camel@suse.com>
Subject: Re: Reg: USB network interface is down after the reboot
From:   Oliver Neukum <oneukum@suse.com>
To:     RAJESH DASARI <raajeshdasari@gmail.com>, linux-usb@vger.kernel.org
Date:   Mon, 13 Jan 2020 14:48:39 +0100
In-Reply-To: <CAPXMrf_d_uKZbohYWfO8rVEg7voBhESesU0w8Ng0M=wsw_75FQ@mail.gmail.com>
References: <CAPXMrf_d_uKZbohYWfO8rVEg7voBhESesU0w8Ng0M=wsw_75FQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 26.12.2019, 15:01 +0530 schrieb RAJESH DASARI:
> Could someone please help, why the usb0 is down on Device A side and
> it there is any known issue or is this  expected behaviour?

Hi,

the kernel cannot just set devices running. Does it work if you up
the device (with "ip" or "ifconfig")? Your device on side A has no
IP. It cannot work. We need to determine whether this is a kernel
issue or your setup in user space.

	HTH
		Oliver

