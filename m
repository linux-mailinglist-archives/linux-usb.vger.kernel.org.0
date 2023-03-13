Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 646A36B7870
	for <lists+linux-usb@lfdr.de>; Mon, 13 Mar 2023 14:08:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbjCMNIH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Mar 2023 09:08:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbjCMNIG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Mar 2023 09:08:06 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7D1171E
        for <linux-usb@vger.kernel.org>; Mon, 13 Mar 2023 06:08:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1678712863; i=christian.schaubschlaeger@gmx.at;
        bh=I/4z9i6bly3hZv9MXEhsJgY9DOLx3sGNzGyKNukrtD8=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=gf0t8KEygL+fRq3IafQ1uqHROG21sk5IDPrRzZaCa9gnkna7GKtNfMGllejETVQZG
         yRHiUU0FORhbWWuAny/J/Anb006pr3CsqQ7dmEtg115X8ptJS+XuksNmRCHVHQr/uX
         c0W5r96ywcY6nSzepRskicFxWsuHom9YtbZJeDZ0dcPMpHOSAynPpdjKfBGRuDBnVs
         /Gim6NMO4Qnxo44KFB+U4QumOmEyectwjiMvDS23HaCZSWQU/NB2rlhQnHH4muGs7e
         mkgttPjaS2IJsxQU1rR0CFZIZj7ZocAOHH8TR3P1xWoHzQGLke7zFfZo+wzSbH6HEq
         3D6nFHxsN0wRg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.189] ([81.189.232.75]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MN5iZ-1ps0Og2XzB-00J3bV; Mon, 13
 Mar 2023 14:07:43 +0100
Message-ID: <9393b12e-a9b1-a897-6634-05a2300e2742@gmx.at>
Date:   Mon, 13 Mar 2023 14:07:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 0/5] thunderbolt: A couple of fixes
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-usb@vger.kernel.org
Cc:     Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>
References: <20230306113605.46137-1-mika.westerberg@linux.intel.com>
 <20230313100700.GF62143@black.fi.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <20230313100700.GF62143@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:9YuZO+Cyfwskuc9gq55StSXuaTQzX8QhKTCo0Cfi3cdQUYkfvnJ
 v1tUdLqtUKLQlsudtM39emH04S7meINW6ySs81Qorlwa8pp8GC7pQ9hDXhpXJym7L00WuDc
 dN8PW+2SBlecDmQyS/NkeMApNYJ1m3wEz80OhbfwaSrcULzk3OxGodkuPdP8m2EE2Y2Oy6r
 aOsdl/Q5+YgTZnW4nUY4A==
UI-OutboundReport: notjunk:1;M01:P0:fiTsRHE6s84=;N1aec2qHTwem8RQ0aTr+W+1y9il
 J9qM9FJjc2uxjW0qe1zG7vAQ/kfqFRE6RCqHaqoXIsoy1FTvO1PfPLmNwZ5Gv/xyOoL8pg3mI
 VW+l1/OAzCxp0sldm3GM6KeDOhq2G4l/YqD9cgUKXtiLIi5+v/K+Mfb8lQNAQE2KEtm/nchCi
 XPnnwRDPskVuraRaRo1gQUUVuoBm6DbCxHWPHJ8jinjzQ4I0Hp0c5L4LW31Ry32+QzquyJFPV
 JF8JSlmq7baIWqVmDYg7mPiVzwa3IHDuVYEGNK7sL843vXWIggbx0UMnQXEGZQglqydfWZMaa
 KzoQN9NeJuAqUdNVoWzKtNw+2t2eB/XzEuQa5Bw4wrIJaQWt2QxyIcDDGqyaLYhEKPnOxqQh8
 PhplnuA7tcBDh1DNpuP5OcTc8qvtNrHeLZoXPqj4rdxjmvHW3V1KsRl8AgXlQkdI08cGoUgxU
 yvNC47gmyQ32y1fCPGJrHYMTKCNoD7RaP1PqbR+jz+iGGnHWm3JRt3RZYe8EX3v5bphTyNpV2
 p67QgXK39mCX9FyTdpVdtlwAEPejxHABFsnPpArhORGCfXrKQ5q6avDuLMJEdsBsKf1Jb6buS
 otPoHJo0HyDMwv9xiE80OcuW3ZNyz0gP4ha9gKl0Wj5IusSilLuQBzgr2HUT7eZbugpeVvGIw
 Okt5wWwXjNWhUswWGeTWayudjik0gHamX7xnDg/ktzet7HGBQ3aGzdLiR5oxhUbAQPUSkzHrX
 YlQXacm5R4KOM8zqgjTgECRPe4/D7bh9UKOcbb5RX7BXHdNTxytDdN+qvEqQvuxd9e67Z08bA
 6IlkqBu7O2L3Q8vQyCc/I7jP8cLZT4quusm9XRlb1QzJeib0R6apjDWSenKbGKWVfFKvAy/an
 dT1UPSgjZ8p4e769ghAUiytGprT9LhC9SbmM2e4fqPCExWQDnWk8jmtnFk7pU8ZrOvIHuRF3H
 X2EqCyU1x+vVi5oLh77HXbX/BZs=
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika,


>> The second one is fixing a reboot time issue reported by Christian that
>> we finally were able to reproduce in the lab. The reason this happened
>> only in Linux is that we enumerate retimers during link bring up and
>> there is certain step missing after the enumeration that leads the link
>> to not come up properly after soft-reboot. This should be fixed with
>> issuing UNSET_INBOUND_SBTX after retimer access and this works in the
>> lab.
>>
>> @Christian, can you check that it solves the issue for you too?

I was told today that the patch solves the issue on the Elitebook!
(don't have the hardware here in my office any more...).

Thanks for fixing this!
Best regards,
Christian


