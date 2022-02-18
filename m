Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 035644BB2F9
	for <lists+linux-usb@lfdr.de>; Fri, 18 Feb 2022 08:11:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231476AbiBRHMD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Feb 2022 02:12:03 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiBRHMD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Feb 2022 02:12:03 -0500
Received: from wp530.webpack.hosteurope.de (wp530.webpack.hosteurope.de [IPv6:2a01:488:42:1000:50ed:8234::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DACFC3DA54
        for <linux-usb@vger.kernel.org>; Thu, 17 Feb 2022 23:11:45 -0800 (PST)
Received: from ip4d144895.dynamic.kabel-deutschland.de ([77.20.72.149] helo=[192.168.66.200]); authenticated
        by wp530.webpack.hosteurope.de running ExIM with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
        id 1nKxQc-0003hp-F5; Fri, 18 Feb 2022 08:11:42 +0100
Message-ID: <b6aa24cc-6ddc-7dda-b098-0033e4f6aa03@leemhuis.info>
Date:   Fri, 18 Feb 2022 08:11:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Content-Language: en-BS
To:     Leo Li <leoyang.li@nxp.com>,
        "jocke@infinera.com" <joakim.tjernlund@infinera.com>,
        "Eugene_Bordenkircher@selinc.com" <Eugene_Bordenkircher@selinc.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "balbi@kernel.org" <balbi@kernel.org>
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <bb5c5d0f-2ae7-8426-0021-baeca8f7dd11@leemhuis.info>
 <MWHPR2201MB15209AA4F2457934BDD3293B91999@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <726d3561-1842-72c7-d4cb-9a99211bb05c@leemhuis.info>
 <MWHPR2201MB1520A85FE05B281DAA30F44A91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <AS8PR04MB89461BF7A3272E5A18ECD0948F669@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <MWHPR2201MB15205A333F1F610D332038AC91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <d0c52d26742b082f5a953a05630a9d70e0eb1356.camel@infinera.com>
 <527ebc333daa2a1d513ea217e5beb61a5acea3fb.camel@infinera.com>
 <AS8PR04MB894614C61E57A80EB4FF7C758F699@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <f31008a0f4e71ff029aa611b0ebcfd83f10ec67f.camel@infinera.com>
 <AS8PR04MB89464D90D2E92A5D401474BD8F6B9@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <ce653a10-c004-75b1-5f70-e23c0c2aee68@leemhuis.info>
From:   Thorsten Leemhuis <regressions@leemhuis.info>
In-Reply-To: <ce653a10-c004-75b1-5f70-e23c0c2aee68@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-bounce-key: webpack.hosteurope.de;regressions@leemhuis.info;1645168305;22670672;
X-HE-SMSGID: 1nKxQc-0003hp-F5
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, this is your Linux kernel regression tracker speaking. Top-posting
for once, to make this easy accessible to everyone.

Sadly it looks to me like nobody is going to address this (quite old)
regression (that afaic only very few people will hit), despite the rough
patch to fix it that was already posted and tested in this thread.

Well, guess that's how it is sometimes. Marking it as "on back burner"
in regzbot to reduce the noise there:

#regzbot backburner: Tested patch available, but things nevertheless got
stuck

Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' hat)

P.S.: As the Linux kernel's regression tracker I'm getting a lot of
reports on my table. I can only look briefly into most of them and lack
knowledge about most of the areas they concern. I thus unfortunately
will sometimes get things wrong or miss something important. I hope
that's not the case here; if you think it is, don't hesitate to tell me
in a public reply, it's in everyone's interest to set the public record
straight.

#regzbot poke



On 20.01.22 13:54, Thorsten Leemhuis wrote:
> Hi, this is your Linux kernel regression tracker speaking.
> 
> On 04.12.21 01:40, Leo Li wrote:
>>> -----Original Message-----
>>> From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
>>> Sent: Thursday, December 2, 2021 4:45 PM
>>> To: regressions@leemhuis.info; Leo Li <leoyang.li@nxp.com>;
>>> Eugene_Bordenkircher@selinc.com; linux-usb@vger.kernel.org; linuxppc-
>>> dev@lists.ozlabs.org
>>> Cc: gregkh@linuxfoundation.org; balbi@kernel.org
>>> Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
>>> unrecoverable loop.
>>>
>>> On Thu, 2021-12-02 at 20:35 +0000, Leo Li wrote:
>>>>
>>>>> -----Original Message-----
>>>>> From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
>>>>> Sent: Wednesday, December 1, 2021 8:19 AM
>>>>> To: regressions@leemhuis.info; Leo Li <leoyang.li@nxp.com>;
>>>>> Eugene_Bordenkircher@selinc.com; linux-usb@vger.kernel.org;
>>>>> linuxppc- dev@lists.ozlabs.org
>>>>> Cc: gregkh@linuxfoundation.org; balbi@kernel.org
>>>>> Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list
>>>>> leads to unrecoverable loop.
>>>>>
>>>>> On Tue, 2021-11-30 at 12:56 +0100, Joakim Tjernlund wrote:
>>>>>> On Mon, 2021-11-29 at 23:48 +0000, Eugene Bordenkircher wrote:
>>>>>>> Agreed,
>>>>>>>
>>>>>>> We are happy pick up the torch on this, but I'd like to try and
>>>>>>> hear from
>>>>> Joakim first before we do.  The patch set is his, so I'd like to
>>>>> give him the opportunity.  I think he's the only one that can add a
>>>>> truly proper description as well because he mentioned that this
>>>>> includes a "few more fixes" than just the one we ran into.  I'd
>>>>> rather hear from him than try to reverse engineer what was being
>>> addressed.
>>>>>>>
>>>>>>> Joakim, if you are still watching the thread, would you like to
>>>>>>> take a stab
>>>>> at it?  If I don't hear from you in a couple days, we'll pick up the
>>>>> torch and do what we can.
> 
> Did anything happen? Sure, it's a old regression from the v3.4-rc4 days,
> but there iirc was already a tested proto-patch in that thread that
> fixes the issue. Or was progress made and I just missed it?
> 
> Ciao, Thorsten
> 
> P.S.: As a Linux kernel regression tracker I'm getting a lot of reports
> on my table. I can only look briefly into most of them. Unfortunately
> therefore I sometimes will get things wrong or miss something important.
> I hope that's not the case here; if you think it is, don't hesitate to
> tell me about it in a public reply, that's in everyone's interest.
> 
> BTW, I have no personal interest in this issue, which is tracked using
> regzbot, my Linux kernel regression tracking bot
> (https://linux-regtracking.leemhuis.info/regzbot/). I'm only posting
> this mail to get things rolling again and hence don't need to be CC on
> all further activities wrt to this regression.
> 
> #regzbot ignore-activity
> 
>>>>>> I am far away from this now and still on 4.19. I don't mind if you
>>>>>> tweak
>>>>> tweak the patches for better "upstreamability"
>>>>>
>>>>> Even better would be to migrate to the chipidea driver, I am told
>>>>> just a few tweaks are needed but this is probably something NXP
>>>>> should do as they have access to other SOC's using chipidea.
>>>>
>>>> I agree with this direction but the problem was with bandwidth.  As this
>>> controller was only used on legacy platforms, it is harder to justify new effort
>>> on it now.
>>>
>>> Legacy? All PPC is legacy and not supported now?
>>
>> I'm not saying that they are not supported, but they are in maintenance only mode.
