Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A8D1B3217AA
	for <lists+linux-usb@lfdr.de>; Mon, 22 Feb 2021 13:54:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231233AbhBVMwm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Feb 2021 07:52:42 -0500
Received: from mx2.suse.de ([195.135.220.15]:45002 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231506AbhBVMw1 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 22 Feb 2021 07:52:27 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1613998301; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zvm6jo+J9hfErKITCznhLHhQAVhT5BAOBIzvmZ0Q3/0=;
        b=NrkuYwblsIKOdLE1sB88iOg6wjNPdGoaqEWEubW8ecKQ10LZfbYQQglpNDuUVFrM0PRK2J
        uBIC2PHIYbb6lHypa93B8VyXqqNB65YwJZnkXt8sFzJf50MrKSdgN0HiW8oycmol2eEmHr
        dlVSmJtJfyyqCGQLCddYlHupnah4f6g=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BC53BAE5C;
        Mon, 22 Feb 2021 12:51:41 +0000 (UTC)
Message-ID: <aba904f15b0bd07592ad59c00c07f6472c8d9663.camel@suse.com>
Subject: Re: [PATCH] USB: UAS: don't unbind and rebind the driver during
 usb_reset_device
From:   Oliver Neukum <oneukum@suse.com>
To:     Hui Wang <hui.wang@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Date:   Mon, 22 Feb 2021 13:51:38 +0100
In-Reply-To: <b28b38fa-3d19-3251-e576-38bd4d828ac1@canonical.com>
References: <20210221085100.4297-1-hui.wang@canonical.com>
         <b1fe6cf4-b48f-c7e6-17c0-2ed04d8f3aa1@redhat.com>
         <ad6601a93f8fc4ec4d1451df5457e51aadf37301.camel@suse.com>
         <b28b38fa-3d19-3251-e576-38bd4d828ac1@canonical.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 22.02.2021, 20:40 +0800 schrieb Hui Wang:
> On 2/22/21 3:59 PM, Oliver Neukum wrote:
> > 
> OK, will find a UAS device to do the test.

Hi,

do you have a design at all?

	Regards
		Oliver


