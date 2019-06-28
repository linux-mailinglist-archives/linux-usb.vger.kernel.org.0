Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F40BD59834
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2019 12:10:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726520AbfF1KKn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Jun 2019 06:10:43 -0400
Received: from mail.steuer-voss.de ([85.183.69.95]:41878 "EHLO
        mail.steuer-voss.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726484AbfF1KKm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Jun 2019 06:10:42 -0400
X-Virus-Scanned: Debian amavisd-new at mail.steuer-voss.de
Received: by mail.steuer-voss.de (Postfix, from userid 1000)
        id 0EA014A8B1; Fri, 28 Jun 2019 12:10:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by mail.steuer-voss.de (Postfix) with ESMTP id 0B98543ED7;
        Fri, 28 Jun 2019 12:10:41 +0200 (CEST)
Date:   Fri, 28 Jun 2019 12:10:41 +0200 (CEST)
From:   Nikolaus Voss <nv@vosn.de>
X-X-Sender: nv@fox.voss.local
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drivers/usb/typec/tps6598x.c: fix portinfo width
In-Reply-To: <20190628095843.GB21701@kuha.fi.intel.com>
Message-ID: <alpine.DEB.2.20.1906281208190.21573@fox.voss.local>
References: <20190628083417.GA21701@kuha.fi.intel.com> <f8daf204d49fff00db33e2b417a20afcc58ad56e.1561712364.git.nikolaus.voss@loewensteinmedical.de> <20190628095843.GB21701@kuha.fi.intel.com>
User-Agent: Alpine 2.20 (DEB 67 2015-01-07)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 28 Jun 2019, Heikki Krogerus wrote:
> On Fri, Jun 28, 2019 at 11:01:08AM +0200, Nikolaus Voss wrote:
>> Portinfo bit field is 3 bits wide, not 2 bits. This led to
>> a wrong driver configuration for some tps6598x configurations.
>>
>> Fixes: 0a4c005bd171 ("usb: typec: driver for TI TPS6598x USB Power Delivery controllers")
>> Signed-off-by: Nikolaus Voss <nikolaus.voss@loewensteinmedical.de>
>
> Shouldn't this be applied to the stable trees as well?

Oh, yes, forgot that again... Greg, could you...?

Niko

[...]
