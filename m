Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF6C32C5059
	for <lists+linux-usb@lfdr.de>; Thu, 26 Nov 2020 09:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730372AbgKZIZG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Nov 2020 03:25:06 -0500
Received: from mx2.suse.de ([195.135.220.15]:37456 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726392AbgKZIZF (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Nov 2020 03:25:05 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1606379104; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ntrLnQjOVrYRti9MXLQM66valadiajQf7XhMT285Tbg=;
        b=iJwbwg6NUfRCn1eoG5DF8wFxouy7jEfu3bf5+8K7eInPetoOBAtzISUSp9zf3UmGTal8kp
        e6jaC0tiA+wne+URyZ8WvpvGsCnHpASKIQYLgi1Fp4Lx3q5zq3Gj3M7eEO93fdDMElQr7a
        dCFNWhGcTnDSaxaD0r/gOPQxeaAJNDI=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id BD64CADD6;
        Thu, 26 Nov 2020 08:25:04 +0000 (UTC)
Message-ID: <d478123862a7e94898aaa771c21cc8cb0a3819fc.camel@suse.com>
Subject: Re: Issues with LaCie USB3 drive and UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>,
        linux-usb@vger.kernel.org
Date:   Thu, 26 Nov 2020 09:24:42 +0100
In-Reply-To: <000f01d6c326$1eea3f50$5cbebdf0$@perdrix.co.uk>
References: <004f01d6b5bd$d4f08ff0$7ed1afd0$@perdrix.co.uk>
                         <eceedea7ca5d950eb8ea4d186a6b01a04d0a804f.camel@suse.com>
                         <001601d6b67d$e97a1e30$bc6e5a90$@perdrix.co.uk>
                 <aebf92944c1ecb256d21108ce092165a0fd904db.camel@suse.com>
                 <001b01d6b68a$79937fa0$6cba7ee0$@perdrix.co.uk>
                 <007901d6b6ab$f0f66230$d2e32690$@perdrix.co.uk>
         <43abe2af0352f17f93e2453a86e2ed47b9913b6a.camel@suse.com>
         <000f01d6c326$1eea3f50$5cbebdf0$@perdrix.co.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Mittwoch, den 25.11.2020, 12:25 +0000 schrieb David C. Partridge:
> Hi Oliver
> 
> I'm still trying to build a kernel with your patch applied but my Ubuntu system isn't cooperating :(
> 
> See the sorry story at 
> https://ubuntuforums.org/showthread.php?t=2453530make ARCH=x86 mrproper
Try using

make ARCH=x86 mrproper

right before

LANG=C fakeroot debian/rules binary

	HTH
		Oliver


