Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B610D220DC7
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 15:13:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731466AbgGONNE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 09:13:04 -0400
Received: from ms-10.1blu.de ([178.254.4.101]:33698 "EHLO ms-10.1blu.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729900AbgGONND (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 15 Jul 2020 09:13:03 -0400
X-Greylist: delayed 3321 seconds by postgrey-1.27 at vger.kernel.org; Wed, 15 Jul 2020 09:13:03 EDT
Received: from [78.43.71.214] (helo=marius.localnet)
        by ms-10.1blu.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.90_1)
        (envelope-from <mail@mariuszachmann.de>)
        id 1jvgLy-0001r4-4U; Wed, 15 Jul 2020 14:17:38 +0200
From:   Marius Zachmann <mail@mariuszachmann.de>
To:     jaap aarts <jaap.aarts1@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] hwmon: add fan/pwm driver for corsair h100i platinum
Date:   Wed, 15 Jul 2020 14:17:37 +0200
Message-ID: <2845728.4EH8KBbfVN@marius>
In-Reply-To: <20200715030740.GB164279@roeck-us.net>
References: <20200714100337.48719-1-jaap.aarts1@gmail.com> <20200715030740.GB164279@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Con-Id: 241080
X-Con-U: 0-mail
X-Originating-IP: 78.43.71.214
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 15.07.20 at 05:07:40 CEST, Guenter Roeck wrote
> On Tue, Jul 14, 2020 at 12:03:38PM +0200, jaap aarts wrote:
> > Adds fan/pwm support for H1000i platinum.
> > Custom temp/fan curves are not supported, however
> > the presets found in the proprietary drivers are avaiable.
> > 
> > Signed-off-by: Jaap Aarts <jaap.aarts1@gmail.com>
> 
> +Marius Zachmann for input.
> 
> Questions:
> - Does this really have to be a different driver or can it be merged into
>   the corsair-cpro driver ?
>

From what I can see the protocol has quite a few differences.
A merged driver would need to implement functions like e.g. set_pwm for
each device seperately. Also error handling and buffer sizes would be
seperate for each device.
If there were more usb/hid drivers in hwmon it maybe could make sense
to have an additional abstraction layer, but for now I do not see
anything which could be gained by this.

Greetings
Marius



