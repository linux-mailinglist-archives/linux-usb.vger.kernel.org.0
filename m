Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0BC0A25C7F4
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 19:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728401AbgICRRz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 13:17:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728353AbgICRRy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 13:17:54 -0400
Received: from canardo.mork.no (canardo.mork.no [IPv6:2001:4641::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C5CEC061244
        for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2020 10:17:53 -0700 (PDT)
Received: from miraculix.mork.no (miraculix.mork.no [IPv6:2001:4641:0:2:7627:374e:db74:e353])
        (authenticated bits=0)
        by canardo.mork.no (8.15.2/8.15.2) with ESMTPSA id 083HHYOs002998
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
        Thu, 3 Sep 2020 19:17:35 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1599153456; bh=mhqc+GacTlpSPGeY/xSnjF3mYcp8j4kS73WCpIkPD2k=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=oKCBJG36vqYNvsgdYZ7DZ+AZ8Rc8kfhi0R3XLnV3STxSX2SjN5CL7Cx783/ky1XSC
         6AXsUrz1ZBuMVHsB4ZGhjJpK+LLiQLiGrOaQXyrmBls1VebPGRhUCoAGXff9QqF0vK
         soGCz9H8zYB8Txyriv/AGb2RSUVa5YsQoxfv4Pc8=
Received: from bjorn by miraculix.mork.no with local (Exim 4.94)
        (envelope-from <bjorn@mork.no>)
        id 1kDsrd-000g2p-QQ; Thu, 03 Sep 2020 19:17:33 +0200
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Santiago Ruano =?utf-8?Q?Rinc=C3=B3n?= 
        <santiago.ruano-rincon@imt-atlantique.fr>
Cc:     Greg KH <gregkh@linuxfoundation.org>, 965074@bugs.debian.org,
        linux-usb@vger.kernel.org, Oliver Neukum <oneukum@suse.de>,
        miguel@det.uvigo.es
Subject: Re: Bug#965074: Patches to make multicast proccesing on CDC NCM drivers
Organization: m
References: <20200730135334.GN1496479@bartik>
        <1596118042.2508.6.camel@suse.de> <20200902114718.GB242939@bartik>
        <20200902120546.GA2008696@kroah.com> <20200902132728.GC242939@bartik>
        <20200902154517.GB2037986@kroah.com>
        <159483131513.13666.11657009071338024929.reportbug@kirby>
        <20200903075037.GD242939__2852.23647240258$1599119665$gmane$org@bartik>
Date:   Thu, 03 Sep 2020 19:17:33 +0200
In-Reply-To: <20200903075037.GD242939__2852.23647240258$1599119665$gmane$org@bartik>
        ("Santiago Ruano =?utf-8?Q?Rinc=C3=B3n=22's?= message of "Thu, 3 Sep 2020
 09:50:37
        +0200")
Message-ID: <87o8mmn5jm.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.102.4 at canardo
X-Virus-Status: Clean
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Santiago Ruano Rinc=C3=B3n <santiago.ruano-rincon@imt-atlantique.fr> writes:
> El 02/09/20 a las 17:45, Greg KH escribi=C3=B3:
>> On Wed, Sep 02, 2020 at 03:27:28PM +0200, Santiago Ruano Rinc=C3=B3n wro=
te:
>>
>> > This:
>> >=20
>> > 37a2ebdd9e597ae1a0270ac747883ea8f6f767b6
>> > e10dcb1b6ba714243ad5a35a11b91cc14103a9a9
>> > e506addeff844237d60545ef4f6141de21471caf
>> > 0226009ce0f6089f9b31211f7a2703cf9a327a01
>>=20
>> These do not look like bugfixes, but a new feature being added for this
>> driver.  So why not just use a newer kernel version for this feature?
>
> From my point of view as user these are bugfixes, since IPv6 NDP or any
> other protocol relying on multicast do not work without them. In other
> words, my computer's networking is broken.

I was in doubt when I submitted these, but ended up specfying net-next
instead of net+stable as the target for a reason.  This is a new feature
as Greg says. Even if the feature is essential for your use case, it is
still new. "Has never been supported" isn't really a bug.

And I am still convinced that my decision was correct.  The patches are
a bit more intrusive than I'd be comfortable submitting to stable, as
was demonstrated by the stupid build bug I added... Fixed by commit
5fd99b5d9950 ("net: cdc_ncm: Fix build error") BTW.

> I want to have them in linux stable releases because that would make
> easier to include them in Debian stable release.

This has not been an absolute requirement in the past. Distros tend to
have a more relaxed stable policy.

Using a newer kernel until Debian moves on is obviously also an option.



Bj=C3=B8rn
