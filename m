Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF6865C561
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jan 2023 18:51:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237959AbjACRuw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Jan 2023 12:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237984AbjACRuZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 3 Jan 2023 12:50:25 -0500
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57E3AC74C
        for <linux-usb@vger.kernel.org>; Tue,  3 Jan 2023 09:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.at; s=s31663417;
        t=1672768204; bh=Jf3d4iEIha72/Cf1N9iA047yXg2KoEbs+nL0n8pwsnY=;
        h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
        b=QdO7KRpRAN+s30G1GUMQW2rpFxEGag8th9qd5tRIZ3MoMeMzC+98hWqXISrY3VI0U
         EKkUiEkxC8m5a/xt8kmUt7O5E2DzhGfB+9fiJYT+idIRvouko5/FpfZBgCtdfzv9sa
         ZjfR9Suk/yzqq6XRSq+hd2rBLbwrio4Fbsomw3MhbfS+Bkz3/z709G4x48SBsLRuWK
         p3i5CDDnVrgvV5xqk0R6ucIyVK2/vjts9FVMXp3+/AUvNP9Ho+2glTeDrs/WntLIi5
         R5ZcWctjKp1/TTugBHR06MuYIdq8xh3HSANgP/33Z0PLpjJ07neIJGDp+PjodTZY/8
         aoTc7OFqVh4hQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.68.119] ([213.225.32.138]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatRT-1ogial12dP-00cMY9; Tue, 03
 Jan 2023 18:50:04 +0100
Message-ID: <86a6b7ca-4302-00fe-97f6-d48ebb5e6171@gmx.at>
Date:   Tue, 3 Jan 2023 18:50:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: Possible problem with thunderbolt 4
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        "michael.simon@cpsd.at" <michael.simon@cpsd.at>
References: <Y67RoYvbRC6OgfOq@black.fi.intel.com>
 <272a5f28-5733-3aa1-ff3e-57febd3b217f@gmx.at>
 <Y67X5JrnRxYN/pns@black.fi.intel.com>
 <00dbeaf9-4d2c-3e3a-fa39-4c232b3a68e6@gmx.at>
 <Y7K7zLoAQVyv0zD5@black.fi.intel.com>
 <011df027-5381-1e10-9c54-e0935ae549f9@gmx.at>
 <Y7ME7EwduIQE38+2@black.fi.intel.com>
 <a324ff2a-d014-83d2-4f30-b865db7c352b@gmx.at>
 <Y7QMlV82mtaApJwJ@black.fi.intel.com>
 <a8c1dd4b-7227-5ba2-97a4-a2dc3d561ea3@gmx.at>
 <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
From:   =?UTF-8?Q?Christian_Schaubschl=c3=a4ger?= 
        <christian.schaubschlaeger@gmx.at>
In-Reply-To: <Y7RSrLYfG1r8b+Zj@black.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:FZLmTCCXjbnRaIZ1vig1ae8GQI3lXSA7LUNIawlNFY+sIrRdks6
 dzJ6eiQtksZkpR8rCbelXindxtO6vibmwneg8B0otErzfwGR4ih0goo8b3Y3Tg6vTVizENk
 M9YZ2fD/4Gmu9UrO3OPrfd8LxAWcLnycTgt8LVE+OQp0AM/7g4igBz1QBBEZ5JQ0PvxHSas
 LAqoAb23sD3UICyhT22Aw==
UI-OutboundReport: notjunk:1;M01:P0:/ydNDhNcbXs=;Ri1lKfaThBL0jzJUjT6YqoUBFoq
 cOC/u3L5SPHmex0Q95R6Unqjo6VxGHfp2Bu20YQuAG2KwNyyKEpNE6vpYoGHXkyR+HOagOKix
 sII6RvIV/QRC0VsB1+zcaz/28mlmC04QbdwuTMnI//d3icIQkib+nTtqTN+hO2C5R7CB8T1LI
 xLqtAnCYKEB3wQVbhDwJDPyOUiUH0tWboC/indnugrYrikjUaPEp9p8O7WWhWtCC8Mdwy/SZT
 LyNZRcZinaxg+LMZd76SXFySczS20Fs8F23Ge6l/d6gPHnpy6YtKhcW0eIAe7VzlCmDSuGr+k
 9tZ2e/NAWO4eRdTR7oo+fO+LceVm8rHwva544VekiuCXbAjy33Frvx6rtT2ph5rBeWBdtUT3D
 gkVe97ZSGs4bDnGyK0A4ZE2dxnvWNr3IFnA7E9lBnX8Ecw8M67ar2+EBR6aJHjPx04suNOsOy
 prMsJ/2U+6GhDgQ7wIb/4Umc3oJOv/gFkKZqOzDdQI1+pMFw9LkMKnqgp5OYySMIp3cPIItOj
 HSfSVTzSPsRA/5mg+d662x5pAT4zBynDjILf7poafVd4CjjlmWXw5TqTPSDCN2ysEfwz/6Dts
 8SF0sJAsQceBp/q6rDKmucpczuI+m5szESyNk89rHpuupBazepKh+7XErp8p3dSazZ+9t6bt+
 6L5Ceg4ryXjjaDM76h6FWfm/SABePg3TByjHTKYnVsBRmSKFCsiHKFVtBp5vQlxLcZXDl8YiX
 VqWgdDWdWWdVzbVHNXvC+L1FrPElabLIuZAJcViKIEAlSk2QGoh7YmTflJQ1jZ3MWC6KRvMW6
 1kPoQ7Fgz4yy5DZ7jAKN8SnoLxLomnPfijFOMbXn6MHXzBO4Zknt3cPBn9nx9IaG16jUVXfOe
 S/+FKDFT3Wlpudg8eIPVWpAu4DWLFY51WF2ioxXlBHcw4vIaT3olnVrOOZwbCZ1fZaQXIXc1J
 vmucqKzPwfbyC32GDnwXBokgzQY=
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,


> Okay you have only one Thunderbolt PCIe root port just as you correctly
> guessed (07.0). At this point I'm running out of ideas what to check or
> try. We have seen similar but only when there is no battery on the
> device which is not your case, I suppose. In this case the initial USB4
> link state is kind of "open" so it may come up or not.

Hm, maybe it _is_ a firmware issue then? Would it, in your opinion, make any sense to confront HP with that issue? Not that I'd have any contacts to HP, but just thinking about options...

Earlier you said that with Windows 11 the behaviour might be the same as in Linux. I'll try that next week (out of office until then). If Win 11 indeed has the same problem, then I guess someone at HP or wherever will address this sooner or later. I mean, the requirement for a working network device/stack after a reboot from an OS is not that unusual I'd say...

Thanks,
Christian

