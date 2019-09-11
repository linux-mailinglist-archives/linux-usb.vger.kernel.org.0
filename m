Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0E87CAFEAA
	for <lists+linux-usb@lfdr.de>; Wed, 11 Sep 2019 16:22:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728217AbfIKOWT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Sep 2019 10:22:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:41886 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726058AbfIKOWS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Sep 2019 10:22:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D15B5BB20;
        Wed, 11 Sep 2019 14:22:17 +0000 (UTC)
Message-ID: <1568211729.11279.6.camel@suse.com>
Subject: Re: ttyACM and BREAK chars ?
From:   Oliver Neukum <oneukum@suse.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 11 Sep 2019 16:22:09 +0200
In-Reply-To: <f7e55901a096024af2d77ae7838df3b658f2c28d.camel@infinera.com>
References: <f7e55901a096024af2d77ae7838df3b658f2c28d.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 11.09.2019, 12:39 +0000 schrieb Joakim Tjernlund:
> Every now and then my ttyACM0 hangs up or sends a BREAK char to my device.
> I am trying to make ttyACM ignore incoming(over USB) and not emit
> any BREAK automatically using termios (IGN_BRK) but that does not make a difference.
> 
> Is BREAK handling unimpl. in ttyACM ?

acm_send_break() implements it.
But the support is optional in ACM devices.

What is bmCapabilities in sysfs for your device?

	Regards
		Oliver

