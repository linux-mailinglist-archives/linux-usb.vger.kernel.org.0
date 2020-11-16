Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FBA2B4582
	for <lists+linux-usb@lfdr.de>; Mon, 16 Nov 2020 15:06:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729415AbgKPOGS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Nov 2020 09:06:18 -0500
Received: from mx2.suse.de ([195.135.220.15]:48846 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727416AbgKPOGS (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Nov 2020 09:06:18 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1605535576; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rM6crSg2IayHa5VaDbYzpC4aq3vLWemfT1wPY2mIF9o=;
        b=T9zHgMuxw/effvxlvlTzK3xC6wxzdk3Kcl3q+YufRIjIPefGPFAm4YQne4WLvM+E40AdHC
        vhtmconab+mUF0j8kSnwszruO8TivHJV2HAbfibU6vUVwz92tNiegYOANdOEkrfg83xK41
        d7NkbrfCTG/zEejOiYPRcuAcC97IJGk=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 2FC25AC23;
        Mon, 16 Nov 2020 14:06:16 +0000 (UTC)
Message-ID: <da3dac18a3c17750ef12b06b09cdac92e3c79f25.camel@suse.com>
Subject: Re: driver/net/usb/r8152 stop working after some time with kernel
 5.10-rc series
From:   Oliver Neukum <oneukum@suse.com>
To:     "Milan P." =?UTF-8?Q?Stani=C4=87?= <mps@arvanta.net>,
        linux-usb@vger.kernel.org
Cc:     Hayes Wang <hayeswang@realtek.com>
Date:   Mon, 16 Nov 2020 15:06:02 +0100
In-Reply-To: <X6/TsY8hd+Z3ITtL@arya.arvanta.net>
References: <X6/TsY8hd+Z3ITtL@arya.arvanta.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Samstag, den 14.11.2020, 13:55 +0100 schrieb Milan P. Stanić:
> 

Hi,

> Driver loads and work some time but at unpredictable time it stops and
> starts to flood 'dmesg' output until shutdown (eth) interface.
> 
> Machine where I test this is arm64 ACER R13 chromebook.

Are you sure this started in v5.10 or did you not try earlier kernels?

> 'dmesg' shows a lot of such messages:
> 
> [305186.211284] r8152 2-1.2.4:1.0 eth0: Couldn't submit rx[000000005d575699], ret = -11

EAGAIN is an unusual error return.

	Regards
		Oliver


