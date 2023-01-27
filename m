Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4CA867E4D9
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jan 2023 13:14:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233604AbjA0MOV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 27 Jan 2023 07:14:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233561AbjA0MOA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 27 Jan 2023 07:14:00 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3984684954
        for <linux-usb@vger.kernel.org>; Fri, 27 Jan 2023 04:08:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1674821265; bh=wImpvUsEoXlbcXAlSwSybY7fczGmqFogF173mJxJbjU=;
        h=X-UI-Sender-Class:Date:Subject:From:To:Cc:References:In-Reply-To;
        b=Cs++oGKCNu91PUxprOKr3ly1ORfXkG2d1brZyFbsyZdfnTgFfHVGWFPBXCW5JdmKj
         jrZdNx13R2wLofqZXdLwIwrxSFEIb+7NN2A6IOA5IRUszZ6ZPXWiURXEGsMpwUxhlm
         GZ8/emmhBT7qdrutqxXRw+kXJjqTDbVm/H7hX6WxR/w8iYIfofotcwAlIEb1tctkT0
         b2UekVls43SXgNH2Uyc1bieqQlRFUMEU+VslRHICXhxmK5fsff2bKJ5I6ysal/h7gE
         NH1AX3NUPZkAhq4D7S7jyRA80qQ7134bjbRIGn3B/ILTjASmLepO7cOqwRLvUEoMFm
         qKTgrAKvYUZWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MtOKc-1oXFPS3LR8-00usMR; Fri, 27
 Jan 2023 13:07:44 +0100
Message-ID: <0c9e644e-a07d-e9bb-f8d6-692d2412fd30@gmx.at>
Date:   Fri, 27 Jan 2023 13:07:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: Possible problem with thunderbolt 4
Content-Language: en-US
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
 <86a6b7ca-4302-00fe-97f6-d48ebb5e6171@gmx.at>
 <Y7UzCY6ujQ2qtoq5@black.fi.intel.com>
 <057da4af-9507-fdc6-9588-160a88210674@gmx.at>
 <Y7wNnrlEWMOV4Cj/@black.fi.intel.com>
 <0f862f75-9805-f5d0-ef89-0b77d0ae8778@gmx.at>
 <Y72AbwKFd9snjZrJ@black.fi.intel.com>
 <3ccb150b-dbd9-c9d0-0e8c-8c169f0d8faf@gmx.at>
 <Y76TS54PJpmseZs3@black.fi.intel.com>
 <8c2da730-ba9b-6ec7-d493-1a6a2ce54622@gmx.at>
 <Y8kXFFrue7l7DKf3@black.fi.intel.com>
 <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
In-Reply-To: <78c5218a-67ef-d61d-09fe-2c2cf7fdc87f@gmx.at>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:rmo6baU4ZffHKAjXa1WQKWBw+wOIclnOb4oT/5yUEXqkRtc+3F2
 +EhCXJQzBIG+z3PoRPTrDbXV+rD+lWqa9NloqtLJQvGMI6nkMIWSL6Hb8FX4SO8GvPKOqsL
 esk2R29lPbp+PobOm9vbeM7zvii36Zq5CQyoMl/ud9lj7ehWimssYXJN/J+udvRZa6d2yrb
 66Ch2dRhBfUyosWapf9aQ==
UI-OutboundReport: notjunk:1;M01:P0:Ljx2S8YSrOA=;wl3Dp1NB+LJHgdD7lGjDwgTlsL8
 r/NP0Zrz7yibMNln9/5Wyv7tBWDUwMdom2JP7Jj+GH+ns5oEjUFqCLLJh4kyYGPEDml8nisx9
 l9ZT/z2i0y1lbsuCHwnAJeQ2XJMtDgDBFiFSNgPCRjP7CqRPDFIkObRR3pj/jVpvHWoGzr3wA
 4hwWOKybg3Vyo4JqikquOSbcA0sV4AejvOMydUpeUpjQFfFxeqa8dfwWwP5ElZEHtKf8zVarG
 dJGePFtx4GB1HMsyWwZyt9XgRiy3VH6X+Mr6aiRauwt3auaKgb6MFW9s2wkOaD3yF3dLbiZXH
 qP0viJG8O5d9ft0V3sTdZR52AvxPJZIaPMVnvVg//QcI2omRRo+YERiitjCUDbrVRxNnv445h
 un1COmnqW0gdGuWYPqkCyzfCZviwvTP4XRoXnp8wAqgOCj9biGaqC1m4e4OXbPnfvDO8/Q9sZ
 oTQ8owySO/TLH8/H2g0VwrOECDJIhCfgM711pru+Go2syfGzJ/fpCJbOhXq/d7MkSTX6E3ByV
 ljkgc1Qn6fb2MrpEZuAJhVXbO4/LqUrjSKLsKGmMpR59jkuuRs1g1tKj7+uuC2owbu9KFMS+f
 cSvP/4g6ijBh8aCsv02IwMGOdscs3KZM/UzMDXOzhrKWtK1FFo4+PpadC+X9gIkWuBzoeup1n
 8aj4UFOPjGH/Qo1cGDUXDFt5A+qrz4FuxEyjiJYBiTY2hIANxv/8UU/rlFpkY4XVPC2xROfra
 WtdcTK5N2oo6IBiV71p3zyy30K5o/eR7j55ekl2O8MID4DrQXNU3f3TrWdsmX2dyG3Ae/2AtM
 tQs/KbVGg/JMu6mHvBw6w8lv5p74yYS2RSL5vK60+nv8+gPwFtsgnXfJqXuT0f6cYNxEgokUy
 dOKNEgwtXT25ItViRY/EUfe/764L0t2B1nnnRn8Ce9UT7kbw1b4o9hKROKmwE0AMx27LZ9cfN
 v7fD4g==
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika,

>>> Previously you said you'd talk with your Windows folks about this; any
>>> news from there?
>> I've talked to them and still in talks with the UEFI folks but the
>> current undestanding is that Windows does not do anything special when
>> the system is rebooted (so equal to what Linux does). There is one
>> "development" system in Israel lab that should be pretty similar to what
>> the HP system of yours is but the person who was going to try to
>> reproduce is in sick leave now.
> Ok...
I was just wondering if there are already any news from your lab in Israel with the similar HP system. And if the issue can be reproduced there...

Another thought of mine was, if it wouldn't it be useful to have a kernel commandline switch (or thunderbolt module option) that allows the user to select whether the software connection manager should be used, or the firmware connection manager (if avialable)? I understand that in general using the sw connection manager is favorable because the OS then has control over the connection, but maybe there are use cases where letting the firmware doing the job is just fine (like in my case ;-)

Thanks and best regards,
Christian


