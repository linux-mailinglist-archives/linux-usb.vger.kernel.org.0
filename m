Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBAC9715E97
	for <lists+linux-usb@lfdr.de>; Tue, 30 May 2023 14:11:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231436AbjE3MLc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 May 2023 08:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229829AbjE3MLb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 May 2023 08:11:31 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A348CB0
        for <linux-usb@vger.kernel.org>; Tue, 30 May 2023 05:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at;
 s=s31663417; t=1685448683; x=1686053483;
 i=christian.schaubschlaeger@gmx.at;
 bh=aX4JTBLLqDPJtDtlZi3vl0MmFJAD3NMZFN0GwctKZAU=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=PyqSCLoSKvL1lL8KMnDVOzdqlMv7fT6INHY98nTiHJ9YDLS6Oj8+ZdZF7r5NSz9kPPEKSW5
 ok7LlSZCBwqaNp5c9d3KXfr2kA7tIl6SUnczaB7LWo/3fs3fNCbm/Aa6yQwoeduV5ktkbNW04
 tyUO0VoAio0BMKxRTWOwTWUw5NYlMEs9ndnYhqvkDDq9ffZ7jD2TFNYuqKNYABG+n6ROTxwfc
 3XlhlFz7J5RNzqu3bbzbXdFzE4uGKKQ4r6arSXR+wW8iGLwCeMUcEgwRSDWTeBB7BL3fsRmX8
 X30d+jkiul9qlzydhZCU64r7/JwIR9LXKkepPK0TEJNgdpwRUFdg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([88.116.17.66]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MowGa-1qRSuD1kKs-00qVXz; Tue, 30
 May 2023 14:11:23 +0200
Message-ID: <d6e7e0d5-0b30-d66c-2ee8-4f0c0caef0b9@gmx.at>
Date:   Tue, 30 May 2023 14:11:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: USB issue on a TB4 controller?
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        linux-usb@vger.kernel.org
References: <a45b9989-c9da-bf4e-94c8-3e1341777b4d@gmx.at>
 <20230526123655.GW45886@black.fi.intel.com>
 <0bbb844d-3348-dc28-311a-d4111f8a7f81@linux.intel.com>
 <2d12af30-4a7c-5fb3-fab8-5759296c68ac@gmx.at>
 <20230530105039.GF45886@black.fi.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <20230530105039.GF45886@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LkaG4AVDLMnN+n9jltZe1+tJMsgu+fiqBG8HifPZc3gIp6pJJLi
 JnN3kCQdULfnArZ0pzDjvU9PhtI2P2T/779aQbcylg3akBq4iuEzBNuOnaksE4ytEc6mJtW
 940eu2kSeKiW3DW5ewvbvJZ+pBaiAL034nOn42t2pRGjT8awbCBTT9TKg2DcoRvmOLyv4Mu
 nZBzJWeflI9+xrQf2LbCg==
UI-OutboundReport: notjunk:1;M01:P0:x9s5pJH5lcU=;BK65utTNJgCTGeEgTA6wqwpbWMq
 7JK7xkg468pqTy4Y9njLYTrnEWNUqH0SZ28pV1xGRWBhgXBOUYbegoEAgonxfwPhBp2ii/YDU
 4XxovTvUlH9VMoerqjQfE1v85Jxl3P5Yb1uiSbIHl2bAS93099NbKzfLO995q0S2FsY7E2ZUT
 e3yLNXBI1tskFLQGBAKSKRCpQsODtRnk1fE/gPknytOujNNTB9fYgOC3KPkxJj4f6ePMvRP7K
 xFPmhJMm8VgRaeRQF5XAmtuliW1YkLXtf79DULS4iTw5gndKSCqEF6qFZl7GuJCxSw1EeedJu
 dGFfO/D25S+4Rnb/G8ebxdiYXgVJn9exVP/nd8Nuh0EwYpTBk3NlezdMUOyP8uU9NMCUCuUnV
 muTJ6yHEQOIbCdi1MLFiJ3W1rOIT/nYbzU8d993EK2yR+X9GY/CfpDQjQ+0xcwVTVUcqDGhPm
 8w57MyF4rTGiSshYWGnOUHZ3rjn8QHRsd6KKfIADR112v/pgau1PlhA5ZeDMpSq/XU0RrjrFm
 9N9C5psF0YKs8OeYOrSSsnkgTNkgeJlUvaPZHRgrfM3F3yujRO1wrMIWn2M3xHQiMexz/ziNE
 ovFYVMllmgvqE2EqDQZy93kFT4g8FzZjkffsCbFfGbEpGU59sBpGsWBlzZ/US7aoXh5AvN7QH
 Yz0PZR18P4McSkLVAB/gGdZZeEpsepAa9S7H955sSGMFDN7b8E7rAd3GWhvAfabQKViZJet3K
 dCS+HOEqySUvFOUUWGOgWWamJELW3Cdwnn8ZAdJcibmRdDwRSYfwgi0U7c0AfDUshXq6r2dcc
 QPRT+qHobpMT+MpHgqi1CQ6peRWdc4/LVQi6Ck7QVbtVV04I+b5MihrAwiDL03sj4Wuk4eS+7
 S8eKMK3WYy24rQ4aSTkH9flm3mfkH1Z2yLplYe0z6PnfR4okzado1P0lFcIJM3Kui/oEMQNc5
 vB5gNFe1CFgX8krJH5HQ7JSwB+w=
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


>> Can I enable this on the command line? Because I guess I need traces fr=
om startup when the dock is connected already.
> I think you can add "trace_event=3Dxhci-hcd" in the kernel command line =
to
> get it enabled boot time. See:
>
> https://docs.kernel.org/trace/events.html#boot-option

Hm,

[=C2=A0=C2=A0=C2=A0 0.029711] Kernel command line: bzImage.efi thunderbolt=
.dyndbg=3D+p trace_event=3Dxhci-hcd root=3DPARTUUID=3D1761F245-C668-41F5-9=
0E4-5BBF2224097A rootwait=C2=A0 nomodeset ima_appraise=3Doff
[=C2=A0=C2=A0=C2=A0 0.063715] Failed to enable trace event: xhci-hcd

have to figure that out first...

Regards,
Christian

