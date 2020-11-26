Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B4CD2C51F3
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 11:23:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726849AbgKZKWb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 05:22:31 -0500
Received: from mx2.suse.de ([195.135.220.15]:44316 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726099AbgKZKWa (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 05:22:30 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1606386149; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=WkAIASby7EV6hpNw6Q/xNz9vjlBOO1A7K7m/JWtfwe4=;
        b=PUzd2m1Y1vJdHw4YaDPmtf51uI1R56vaOPhdv43S9NDz/vgmU12PcM+2jn3I5m2j5sVizU
        QHNEwNhoFxGNWqTCj32EYfg6Mp9R/HiH+Eq8UTEfnREKNJ7HsC3dD5EFFKwlLYVmE34mZM
        ueJGQrqD1FkRlciqE6m0+sG17ysTwaU=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B7132ABD7;
        Thu, 26 Nov 2020 10:22:29 +0000 (UTC)
Message-ID: <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com>
Subject: Re: Issues with LaCie USB3 drive and UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>,
        linux-usb@vger.kernel.org
Date:   Thu, 26 Nov 2020 11:22:07 +0100
In-Reply-To: <008101d6c3d7$2427ee70$6c77cb50$@perdrix.co.uk>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>
                              <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>
                               <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>
                         <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>
                       <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>
                         <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>
                 <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>
               <000f01d6c326$1eea3f50$5cbebdf0$@perdrix.co.uk>
         <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com>
         <008101d6c3d7$2427ee70$6c77cb50$@perdrix.co.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 26.11.2020, 09:33 +0000 schrieb David C. Partridge:
> I tried that but that wiped out the debian folder :(

Hi,

that is a pronblem as I do not use Debian, nor know a lot about it.
You can try "make clean" instead of "make mrproper" , as it is milder.
And yes, this is programmer humor.

	HTH
		Oliver


