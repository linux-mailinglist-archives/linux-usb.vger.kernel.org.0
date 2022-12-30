Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 64F1E6597FF
	for <lists+linux-usb@lfdr.de>; Fri, 30 Dec 2022 13:09:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbiL3MJp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 30 Dec 2022 07:09:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229513AbiL3MJn (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 30 Dec 2022 07:09:43 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F5A6FF3
        for <linux-usb@vger.kernel.org>; Fri, 30 Dec 2022 04:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1672402176; bh=TktV1zZAULvL0ztLCKbWRiu7LRziVoCi4iFVoBuMO0A=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=R0h9PFsQG22u+I/cQ0rOeIUyRWush+Agna9IY7nEX6Em5uq0VbBtSvp096mIPfkYz
         UQ/Qo9hwvXiKyD9In6lrHZUIOw2orug9ZVDvQBhANa7deQ9xYJNKsNhAylPeaGAdVd
         aCL1pVJQLVX0ZU3B78dcrhGn3CsGiB8Vk3M9PsfUNXSH8s0vwPu659MIGtDU0x/v1C
         acM98TmSwF+yKGKAGUjC2BF9sdMBQRI4G9ZlnfZCyZ9WJhBpxBVhklaDqnrAnbMchq
         /oApmnYt/VW/df03cAQm5TH+9ZElN9dnGVwDIF2+uB0pHnj9ftyclf/OfxmouAvpvd
         dPAoBGoq50UHw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.70] ([81.189.232.75]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MgNh1-1ochsF08IZ-00hz66; Fri, 30
 Dec 2022 13:09:36 +0100
Message-ID: <272a5f28-5733-3aa1-ff3e-57febd3b217f@gmx.at>
Date:   Fri, 30 Dec 2022 13:08:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: Possible problem with thunderbolt 4
Content-Language: en-US
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <b556f5ed-5ee8-9990-9910-afd60db93310@gmx.at>
 <Y6sBI+xrkQaWtQxo@black.fi.intel.com>
 <588ed5c7-864f-46b5-d7d7-af6c32ca2c52@gmx.at>
 <Y66vWYdLLAOG81+f@black.fi.intel.com>
 <c334eb1f-1130-04d7-e7a6-cce9a90fd2e8@gmx.at>
 <Y67RoYvbRC6OgfOq@black.fi.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y67RoYvbRC6OgfOq@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:3FOip8wiG7jN3MGQYUwZv1YwrGSuBRXTMzQNRZGtiOh0uObUWCW
 BBPLwaB0gitiHIzFOZvxCEKaz1TaA87YrIq4yUpAUIfD6zbiFz4eNxMSEPNf0aau6pLS+oV
 1jJDqcZZ9nVdk19rJ5ljulRc2WUlpiTOWA1H/4NClJovnMsbq92pHv6y0ewSjNFx6HrDhA0
 x6Ejsucg4NxV8qltB7Vpw==
UI-OutboundReport: notjunk:1;M01:P0:q15RyzkHq8s=;dXgN8gnvNhTqnnbKB4xTuYN3b0F
 w2bEpejz3x7rTk/PZek1MKccOKPxlRIKrkCl4zYesKPisAEupYaMc+u2yVa1HXDePntT5J7E2
 nOcTFjilE4tLzZ6ea3BM0h2TnuHOA2r+vK1ceCyIHLamzrjYUXkLHXF31DZmj06oj/4KKiaz+
 hEsxhSWs+oqm0pZ6M7apHwfB8EDOlv2eYjEnr8KBJc66JA9VICudK602BDvNX2u5g4FKTHXmr
 /umAI5RGp1R5H3/Qzs3VzlmfYCtyHByrY9urfKlOUBmgqu06HGIrcWaQCZRKoELwvi8DwKN34
 kuoi0N0VSjC1RSjCxJXuFOHciBEF5bnC31z7Km9D+apR9gkyrKXSwbi7jCvy61CTyfSKrFfoT
 a0xvT5Q19BjJb9t7Uklv4EPSav/rfO6Rer31tLn8RFirHi1DlXggksGbnP93x/NfUodRGgyS4
 20gw9Hmdx6T9/eNVsdEPovtvJhNSDliC3jx2TzqI7me55uTBxzO4hF79wz5CWfvSBYRqn+mrO
 MucbBlITPhBaf+7iuaW0GIbhQtpX+8obHhMTxqAURKbKAobj2pMsXGzVR0dzxMgoUUzWdep2j
 KVdRIQNnytbnkrqu42vHHPNwzm9yE/3GlvNPn885Jj+kWzj4ln1xJ2tmkvSyJYBr/soxFV0JX
 WPLVUNe6SZgFMI4nXYsqC2LzFs6X/F8kNgKrDGxuuS2G8Dx4EgxEUwC9d7ykWZ5mY8idBs4aF
 nfeaVS9hJsjRV83ISaE3QYZtEobzR3PZocSIaYXaujucNwwohnGDkRGei4VY7KfPaqIX31V1G
 5zqN7RlNjR7z9l8gcG0kkCbJO9YzA18fsmogO76kvFS4KJL3xtcnyGQ6aGQob0uDGqbWlP46r
 /A7w3+L/Y0nsHnaP4u+KGMSXB01RwdP0Pn6vOxwcbHsHEPaqWskpdNIaN4/0/kLQboLfpuvs1
 tJUNvxklAbLURdR2XGfmyHGx5tM=
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


> No but this is not the "final" solution - just an experiment.
>
> Okay so we have this:
>
> - When both Linux and Windows uses the same firmware connection manager
>   all work.
>
> - If you install Windows 11 (or whatever the fresh one is that actually
>   supports USB4 and software connection manager) you end up in the
>   exact same situation.
I'm running Win10 22H2 on this machine... I could upgrade to Win11 if this helps.

> Can you try following:
>
> 1. Go back to CONFIG_USB4=m
> 2. Boot the system up
> 3. Check that the PCIe tunneling is up and things work as expected
> 4. Unplug the dock
> 5. Unload the Thunderbolt driver
>
>   # rmmod thunderbolt
>
> 6. Plug the dock back
> 7. Soft reboot the system
>
> Does this make the PXE boot see the connected device?
After these steps the firmware sees the connected device!

If I just remove the module without un- and re-plugging the cable, the connection is not there in the firmware after the reboot.

Christian

