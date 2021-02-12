Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4374319D85
	for <lists+linux-usb@lfdr.de>; Fri, 12 Feb 2021 12:47:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbhBLLn7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Feb 2021 06:43:59 -0500
Received: from mx2.suse.de ([195.135.220.15]:33762 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229650AbhBLLn6 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 12 Feb 2021 06:43:58 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1613130191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SIwKTh6S7KjZl5F/jjSrxqYEqfJbun0RVMR+0IJtRgQ=;
        b=etPfLsbns1rYEScGHqHfllwhSEmL7jF3rQNjg6K5RmkPG7tA1DfR+XvtDAm/kHpf1FiVTM
        smlZLbEPl3OSmwPdo2m4YM4zcy3a7//yE25YjgmAkirN7XLUPA7TOvj79Dfqx3m5mfyBZq
        ZOC4ZFw1v2eXlnBei3TFtxQi5/U1P6w=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7B556AC69;
        Fri, 12 Feb 2021 11:43:11 +0000 (UTC)
Message-ID: <88cbbc09e998761097677111b9d166fc1f677026.camel@suse.com>
Subject: Re: [PATCH v3] Goodix Fingerprint device is not a modem
From:   Oliver Neukum <oneukum@suse.com>
To:     Yorick de Wid <ydewid@gmail.com>, linux-usb@vger.kernel.org
Date:   Fri, 12 Feb 2021 12:43:05 +0100
In-Reply-To: <20210212111046.170342-1-ydewid@gmail.com>
References: <20210212110738.169808-1-ydewid@gmail.com>
         <20210212111046.170342-1-ydewid@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 12.02.2021, 12:10 +0100 schrieb Yorick de Wid:
> The CDC ACM driver is false matching the Goodix Fingerprint device against
> the USB_CDC_ACM_PROTO_AT_V25TER.

Hi,

what else is it? Which driver should be used or is it to be handled
in user space? That needs to go into the change log. Otherwise
this patch just looks like it drops every access to the device.

	Regards
		Oliver


