Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 588526693E2
	for <lists+linux-usb@lfdr.de>; Fri, 13 Jan 2023 11:18:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240413AbjAMKSI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 Jan 2023 05:18:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240196AbjAMKRg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 Jan 2023 05:17:36 -0500
Received: from dilbert.mork.no (dilbert.mork.no [IPv6:2a01:4f9:c010:a439::d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 340E7183A1;
        Fri, 13 Jan 2023 02:17:30 -0800 (PST)
Received: from canardo.dyn.mork.no ([IPv6:2a01:799:c9a:3200:0:0:0:1])
        (authenticated bits=0)
        by dilbert.mork.no (8.15.2/8.15.2) with ESMTPSA id 30DAGrIm1867629
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
        Fri, 13 Jan 2023 10:16:54 GMT
Received: from miraculix.mork.no ([IPv6:2a01:799:c9a:3202:549f:9f7a:c9d8:875b])
        (authenticated bits=0)
        by canardo.dyn.mork.no (8.15.2/8.15.2) with ESMTPSA id 30DAGlEi020267
        (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK);
        Fri, 13 Jan 2023 11:16:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mork.no; s=b;
        t=1673605008; bh=UwgL4KMt3pjnoZk+tNr+CMFYAZq3Cr7X+xqZUA7Ufo0=;
        h=From:To:Cc:Subject:References:Date:Message-ID:From;
        b=SeoVtk2B2QVOHm8ZcMEo7om8ODX+yJXE7uRF+ratRhcaUxrRmWqUhHUHucsKKZZ8d
         Z3QTE59AJzj80KDct7UX7pmOmPsnz371cimLbixMvl29ArvU5/LSZ9ZHBR1piPATpn
         hIJtdH8o5mQFKy/V1NmtB+nUb5yGWghn3Z5ZybWY=
Received: (nullmailer pid 210628 invoked by uid 1000);
        Fri, 13 Jan 2023 10:16:47 -0000
From:   =?utf-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
To:     Greg KH <greg@kroah.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "David S . Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, linux-usb@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] r8152; preserve device list format
Organization: m
References: <87k01s6tkr.fsf@miraculix.mork.no>
        <20230112100100.180708-1-bjorn@mork.no> <Y7/dBXrI2QkiBFlW@kroah.com>
        <87cz7k6ooc.fsf@miraculix.mork.no> <878ri86o6j.fsf@miraculix.mork.no>
        <Y7/ir/zcJQUVec72@kroah.com>
Date:   Fri, 13 Jan 2023 11:16:47 +0100
In-Reply-To: <Y7/ir/zcJQUVec72@kroah.com> (Greg KH's message of "Thu, 12 Jan
        2023 11:36:31 +0100")
Message-ID: <874jsu68og.fsf@miraculix.mork.no>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Virus-Scanned: clamav-milter 0.103.7 at canardo
X-Virus-Status: Clean
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Greg KH <greg@kroah.com> writes:
> On Thu, Jan 12, 2023 at 11:29:40AM +0100, Bj=C3=B8rn Mork wrote:
>> Bj=C3=B8rn Mork <bjorn@mork.no> writes:
>> > Greg KH <greg@kroah.com> writes:
>> >
>> >> No need for this, just backport the original change to older kernels =
and
>> >> all will be fine.
>> >>
>> >> Don't live with stuff you don't want to because of stable kernels,
>> >> that's not how this whole process works at all :)
>> >
>> > OK, thanks.  Will prepare a patch for stable instead then.
>> >
>> > But I guess the original patch is unacceptable for stable as-is? It
>> > changes how Linux react to these devces, and includes a completely new
>> > USB device driver (i.e not interface driver).
>>=20
>> Doh!  I gotta start thinking before I send email.  Will start right
>> after sending this one ;-)
>>=20
>> We cannot backport the device-id table change to stable without taking
>> the rest of the patch. The strategy used by the old driver needs two
>> entries per device ID, which is why the macro was there.
>>=20
>> So the question is: Can commit ec51fbd1b8a2 ("r8152: add USB device
>> driver for config selection") be accepted in stable?
>>=20
>> ( Direct link for convenience since it's not yet in mainline:
>> https://git.kernel.org/pub/scm/linux/kernel/git/netdev/net-next.git/comm=
it/drivers/net/usb/r8152.c?id=3Dec51fbd1b8a2bca2948dede99c14ec63dc57ff6b
>> )
>>=20
>> This is not within the rules as I read them, but it's your call...
>
> Ah, yeah, that's simple enough, I'd take it if you send it to me :)

Great!

There is no point backporting to anything older than v5.15 since the
patch depend on significant driver changes between v5.10 and v5.15.  The
good news is that those changes also modified the macro in question so
any device ID patch for v5.10 or older will have to be fixed up in any
case.  So we don't lose anything by ignoring the older longterm kernels
here.

IIUC the special netdev stable rules are gone.  But if this is going to
stable, then I believe it still has to go to "net" first.

David/Jakub - Would you please pick

  ec51fbd1b8a2 ("r8152: add USB device driver for config selection")
  69649ef84053 ("cdc_ether: no need to blacklist any r8152 devices")

from net-next to net?  With a "CC: stable" preferably.  Or do you prefer
some other solution?



Bj=C3=B8rn
