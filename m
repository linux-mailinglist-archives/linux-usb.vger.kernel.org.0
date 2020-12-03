Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 546E62CD88D
	for <lists+linux-usb@lfdr.de>; Thu,  3 Dec 2020 15:09:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728761AbgLCOH0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Dec 2020 09:07:26 -0500
Received: from mx2.suse.de ([195.135.220.15]:40016 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726257AbgLCOHZ (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 3 Dec 2020 09:07:25 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1607004399; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
         mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mE74S2dK+c7tkvMOilHIczGuYXsUHhHJ0oGaGcETI4Y=;
        b=SV/wjXNSyW7i4WpTfytWvDtVwKdwFcOWmKXwVOzGCrpoN8QE9H5Z9DfXF6uvDz6VciDM8h
        Vi4UuBlcjJwdlSEjDApa7V/K8KGCl1NAF9VKwPzLbb/JDN/VnpDhvEjeLSTQxSG2783Iod
        QoJpY+1NkTtdJIFaCRDQTC5NP2V6Uf4=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 1415CAC65;
        Thu,  3 Dec 2020 14:06:39 +0000 (UTC)
Message-ID: <f5b4e5fccec5521059c78d4f4345c339dce707d5.camel@suse.com>
Subject: Re: Issues with LaCie USB3 drive and UAS
From:   Oliver Neukum <oneukum@suse.com>
To:     "David C. Partridge" <david.partridge@perdrix.co.uk>,
        linux-usb@vger.kernel.org
Date:   Thu, 03 Dec 2020 15:06:36 +0100
In-Reply-To: <000301d6c919$af7a94e0$0e6fbea0$@perdrix.co.uk>
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
                 <11ea70180f52b4965a451b3970891e0f547c777b.camel@suse.com>
                 <000001d6c89c$086812e0$193838a0$@perdrix.co.uk>
         <612be9a9cd6ffdb9492781e174859c7b4e694a86.camel@suse.com>
         <000301d6c919$af7a94e0$0e6fbea0$@perdrix.co.uk>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 03.12.2020, 02:11 +0000 schrieb David C. Partridge:
> Now with uas.ko	and usb-storage.ko 

Hi,

upon further reading, could you repeat the test with an additional
SINGLE_LUN quirk?

	Regards
		Oliver


