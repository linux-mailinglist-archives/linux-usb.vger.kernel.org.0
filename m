Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A979C6EF3A2
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 13:49:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240190AbjDZLtZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Apr 2023 07:49:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230401AbjDZLtY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Apr 2023 07:49:24 -0400
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on2047.outbound.protection.outlook.com [40.107.14.47])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB708422D
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 04:49:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TbDD7uNZdrkD5kaNhwMAAmWTdICf6YVTvCGhHKO7dohGmH65MCOpyI/2hpkv8s3dSIevq4eK2UdVQGIc5PY3rWGgbJP+j+wKexFbNVPgLDskRUec872krkfqtIlkH4P+MMXrafTQSNkNJQCL6tEPDzE0j++HXo3u2csFdPYF1GYf01C0ut3CVkS6qx2WapwZJBeznN7YHO09/nnZD1g7e4DlrbJxUYXkJCQa8cncOAd3/NuIxV8/pq7rHg6URlSjAcsi9x3WbA+wnCSTROZFaBcOzBCiV3ouTQTTSnugKYio1XLKZQy/cR27DNRUvO/GRFPcq/iw9x0SVssCk13gBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CIxwSIGzv4Wi/KLtZGr0/ghGS4ts9np25ZNBake0Fs=;
 b=jRmRhOgEVf0+ytMUYsJbp0/yZGVSOe8ix+CmSaIAjwf7R/wyxqQS4I7LnBPTSTiCmh9dWpjuC/5G6mhfLRciTBwNgdzZ2HhTxDmYb7bjroNtd9oHAkklJOyoUEfGMFh5TEBxYttnD9b+Z7wPQZcCHv/WL8Zh5q6NhPtSuA1seNJXc6S9KJSH4yfgdn0XWlAVutzMaUSFj3JuHD1sP+8PVzIIXNMLZhD5z5QPBq3wOt6tY6iY55ICdtr62vTkaZ5OelD9oe3H1GV7hP0kvAnpD41S+gIelQj0WFjB+3URzTr7vm1pLABWmLSBjg2loQjm4ikB5ftHeLSi+75wuR2MUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CIxwSIGzv4Wi/KLtZGr0/ghGS4ts9np25ZNBake0Fs=;
 b=KBr6pIcdHGXDAi3Az42aU5+l2gTXEPR0ttupe0zwWWuBxdGGBwJHuddFNqwm64rXtu0HThP7EwO9pJ/pARJvFw/TKVMxOpcNRV9UrDpcBnL4D7yBuTMmenjkQpTZLJkwHRC55/hbljRRH1ozyqfDPSaN60vYv06EZBCeROz677zIGiZ5MU2TwpsHoEEpXSYEIGuVuVZ1rOzNxp34zR5YmS62wmEp7/cvgsiK/ISpChIjRqtHU3Hj3/6VZyiA6Km6mawKWTyHVXCgVMKdRV/Mx55N4/APIT9Y0dj4NXjC5GBiADV84d/opZiI24jimfbK1ggQnDXreNR+oz+uVsAtYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DB9PR04MB9259.eurprd04.prod.outlook.com (2603:10a6:10:371::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.21; Wed, 26 Apr
 2023 11:49:19 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::d79f:7e5d:c93b:f47b]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::d79f:7e5d:c93b:f47b%6]) with mapi id 15.20.6340.021; Wed, 26 Apr 2023
 11:49:19 +0000
Message-ID: <435b6cfd-5a57-0e11-5b1a-10e9c8e0abbc@theobroma-systems.com>
Date:   Wed, 26 Apr 2023 13:49:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH] usb: gadget: u_ether: Fix host MAC address case
Content-Language: en-US
To:     =?UTF-8?Q?Konrad_Gr=c3=a4fe?= <k.graefe@gateware.de>,
        gregkh@linuxfoundation.org
Cc:     linux-usb@vger.kernel.org
References: <2023042534-thing-shamrock-88c1@gregkh>
 <d62f5a2b-ec47-6cee-4cf1-0d1ea18dee56@gateware.de>
From:   Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <d62f5a2b-ec47-6cee-4cf1-0d1ea18dee56@gateware.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1P195CA0051.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:802:5a::40) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DB9PR04MB9259:EE_
X-MS-Office365-Filtering-Correlation-Id: fbf7b703-81f6-4d19-3132-08db464c44db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uzdqVkSpfzk6iQi8fZUhXWlkz1jpZ5t/IbrtJ3mUBRWkH+ecKhO/6GQe3focgwyz4NSHaIzOcI7iYaIczZcrzjXzCAyOFplADno+8zyxj46v2L+/DOkisyvhpXczGLnud45/L8I6MH+PGdN0QHwxHrtOx0wahvCxbOeG0thGAwkDemxmuuECVoogDI3oSsxx3aRcZOSEZ92iP5o9zlL61byKF4xQVvSMBMQxY262cW9l54GaISqTAkag1aZVsMjN5i5NsRQIoJBnxZvizmvXOtzOwGvOoPyku6G3X+pSRqK2H4BRePHx1gs1AkjDzUOxNoOXAcpzpOkl1JfPzWdDqZ92TPovyxC9+f3cxogSwmWFdi9WMFuAuNSOx3tJmhplN8MvXLyvZ2tpORD1wFhsoApOA3APPU6M5zR3aevAoeSuNagkEZwd/JZRieOoo8+qy8hYpZTxogXR9aNo/zqMIHb3J9LFD5s322cG/IXFh76cbFWVNigFUFNZvLnQ45tejbsFCiUf2382hyrmQrXTv3R/GnwxydGHNIiK2OUCiEYhDBbB/Dsif6AMy1/hv0qVhZFt5ZMM6zO0ZOiP0dIFXZbNVwViovuVgPO0miIzqOQ47dE1cx7pDvl5X8tqPaLrB51gAZnidnT53jPPcvQIAw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(346002)(376002)(366004)(39850400004)(136003)(396003)(451199021)(5660300002)(8936002)(38100700002)(8676002)(86362001)(316002)(66946007)(66556008)(66476007)(31696002)(4326008)(44832011)(41300700001)(2906002)(186003)(6506007)(6512007)(6486002)(966005)(6666004)(36756003)(66574015)(83380400001)(53546011)(2616005)(31686004)(478600001)(45080400002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlFzVjE2emdZNEJEb3JHZ3ZvNVNXME1oSzlDL1ZJMzJqVTMxYjc1ekVVTVFQ?=
 =?utf-8?B?dkNsUTc2djFDdkt6RzJNT0ZuSnROWExvMVRmamowdEpYRHAzWStXS0Y4TDlj?=
 =?utf-8?B?UGZDTVBMYmpaeTFoUjFreVNyNFhMeE9FN3BkTmFUMkFTL2hPTHkvN1BINCtT?=
 =?utf-8?B?Qi9ialhmNkNWbGZESmlHM2tZUXVkUnhEa0h6RUdibjFIcnVacXk5ZkNWa1Bv?=
 =?utf-8?B?RlM1a1B4ZjIxS2thVXJwdTBxc05FUnJXOVJ5Q1BUR3lHRndCNlZqbDQ5Ny9O?=
 =?utf-8?B?MmVWWjZGZDAyeTNJSHd2N050eWRjNWhvakZnMjVVMVBmNUtaWFFCZFhKVnU3?=
 =?utf-8?B?SXlQQ1NIRkUzWElVMDlYaEs4MjhQeWpVVzRubkVyNFNZU2VNb2tESFk5em1C?=
 =?utf-8?B?cGdNRHoycDAzZWFUMEs3NjAvcFhSOXp2dXcrNjBXcjQ5bHY3cS8xT3JROUly?=
 =?utf-8?B?alpCdUtMekNXcVgwbHgrMmNYbWZnM2w4UktHNGxyUmhPT3JZMGlHWFBYVjFw?=
 =?utf-8?B?b3NkQ1NQRFdvOFF0Z1Y0aVFYcVJrWDdlZVNuaGFqZWxaWElNblBERnRkQ3JE?=
 =?utf-8?B?bEFtekg4SWpNSE1LTTgxdW92OUd6UWk1aFB3SjBybGl5ODUxYjhBU2NFeGlT?=
 =?utf-8?B?SVZLd1BPUnB6TlJjdzlWU1FsUUplT0lMaWlLQ20xdVRhaGhrejRUNkVXbjRh?=
 =?utf-8?B?ZDI5dGo2MnVGRURuSTF2VmtJb2p2UHBreWc5dTNpYVpPNHdXSXd0bTJMV0xH?=
 =?utf-8?B?VHlaMGs4eHhZcm8yYzlSN0VKZVVoSUZNQ0lnQVAzUHcvVmpubmcwdUZsQUpO?=
 =?utf-8?B?VGRmMzZGQ2FTODF5d0szajh0Ny9MYmFlZkhGcjZnRURYN2xxYXJGOXVLMk16?=
 =?utf-8?B?NWM0YUJTeFlCTHdGNGw5NkpMaFEyT1p6amJkUlBtOEVDL28rVTk5RU4zTFpK?=
 =?utf-8?B?Y1JFckZRRlVkSEhUelNPekx3Zi85LytzVm8veERSdGVFS0J3cWpQemVpOUxi?=
 =?utf-8?B?aC9EWkRJeTFDdXY3VXQ0UTdpSzR5bko0TWhVZHZyQ0hKUGhoTFZXMEtOaStD?=
 =?utf-8?B?aFYrdUJPNmNBdWVNeXA0SDhEQmVPVnhRRUVoMHBBdWVyTmpwR2kxM0IrRGxB?=
 =?utf-8?B?OVdZQ0ZtMGpiSjFpQW02L2VZaW5aZjFyeDMwL0EyRXZtbXlFZ2VEbytlWEhR?=
 =?utf-8?B?NG02dDBkNHJRaXBRU296dHo0ZTFpNUFNd0swQ3I1NTU5U3lZbkRMQVV0OW5M?=
 =?utf-8?B?WmFtbnVZMGc5WHVDNm91U0ZObzZiWTFGOFd0K2tremcyWlVPQUtzbzVTUW0z?=
 =?utf-8?B?N1VHSXRMQ0pTQjdxcE1pOEJkYytCcWdFNFpwNk1GSnpoU1B5MEVrMHBQVjBm?=
 =?utf-8?B?c3NoNmJadTRPNDBiRXdWT05IdTUrUCtmdm1IQm1ON3ozT1doR2RMd25FbUxW?=
 =?utf-8?B?UTEyTEZGRDRDaVR1YzdVbEQvcjlSVlIvV1oya2RTZlF3OWtXT1JYcTY3UXdS?=
 =?utf-8?B?cTBLWmhrUmZ1VXl3Mlpqb3g4akQvczk0czFNN3VwWGNCUkxwK2dLRGs4cWJp?=
 =?utf-8?B?dHdaQUUwVHRVNVB1aVU4ZnNyMGN2QTVRYzBuNTdpRHRWYVM5cmxTMU1tRWlQ?=
 =?utf-8?B?WFdVYkpWMlhTMVpaSCtkTmVPTUp6ZjhFQVdKK3pkMzIxdXBDY054QnJPUEZu?=
 =?utf-8?B?S25PSk9OSVJEbDRRY25lTWxiczdnRENFdWRuTEZtT1VnNjVmc1o5MzBHNThM?=
 =?utf-8?B?cHIvRWJGR2RFbEg2M3JBMUpBVGxrbmM0bTlndnpscVBuWDhXUXBNKytNaVV1?=
 =?utf-8?B?Rzh6b05HWmpXbEc0Yy9VYlRTc3NrS0psbDNHMnZkRkZ5MUwrc1d6cm1iRFF2?=
 =?utf-8?B?UTA4NlR2c2YzMm1iMGpuS3U5M3ZPc1R2aU84ZWNTMUJ2UU5GcFpYa25jNGxr?=
 =?utf-8?B?YnZSTnRmZ3BKbEZCUlEvQW5DeHEvYlB2MEFCN1pJYWxueFJ4QTRBM0d3aERU?=
 =?utf-8?B?dDExTnpFb1YwUWlDQk1vVGovZlRySGYwOFQzUTNZVjd2Qk1icGNNczZrZlhl?=
 =?utf-8?B?aS9VTEIydzE3aEdTbzZuVXg1ZjR1M0VWMTNIYkI4SG9IL0NaWWZCNHI0UlM2?=
 =?utf-8?B?eVd3YWJUWU80cFRhOGRJMWwyNkZ4WW1WSzBYbXR6NWJXMlhlME5ZTmZJQ1JJ?=
 =?utf-8?B?ZnBMcnhuckJ5V2pyaUJjck12NHlOT0YwaCtlRXc5dXpqN1lDYlcvMmptRUUx?=
 =?utf-8?B?eXF4dEJEa3FhRmtUV0RhQjNRUkRBPT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbf7b703-81f6-4d19-3132-08db464c44db
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2023 11:49:19.1761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wgZqdaWQI7McNv8BNSfX6iZpjmpXfhlpgInVkgyvH67OwhytDG6UwgXbRnddqlFb0AXLa6GQ53jcAMG7Cms2NrwtajDihkTkwWek/pmXgvVBCWRARYJZPihquZIlSip6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9259
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Konrad,

On 4/26/23 12:17, Konrad Gräfe wrote:
> 
> As the CDC-ECM specification states the host MAC address must be sent to
> the host as an uppercase hexadecimal string:
>      The Unicode character is chosen from the set of values 30h through
>      39h and 41h through 46h (0-9 and A-F).
> 
> However, snprintf(.., "%pm", ..) generates a lowercase MAC address
> string. While most host drivers are tolerant to this, UsbNcm.sys on
> Windows 10 is not. Instead it uses a different MAC address with all
> bytes set to zero including and after the first byte containing a
> lowercase letter. On Windows 11 Microsoft fixed it, but apparently they
> did not backport the fix.
> 
> This change fixes the issue by upper-casing the MAC to comply with the
> specification.
> 
> Signed-off-by: Konrad Gräfe <k.graefe@gateware.de>
> ---
> V1 -> V2: Fixed checkpatch.pl warnings
> 

When sending a new version, please use the -v option of git format-patch 
to add the v2 prefix in the [PATCH] header, see 
https://lore.kernel.org/lkml/20230417065005.24967-1-yu.tu@amlogic.com/ 
(here a v7).

c.f. 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#the-canonical-patch-format

Additionally, please use scripts/get_maintainer.pl on your patch to know 
who to put in the recipient list, here you're missing 
linux-kernel@vger.kernel.org which is always added. If I'm not mistaken, 
it's basically used for archival purposes but also so people don't have 
to subscribe or search through all mailing list to know what's going on 
globally in the kernel community.

>   drivers/usb/gadget/function/u_ether.c | 9 ++++++++-
>   1 file changed, 8 insertions(+), 1 deletion(-)
> 

The patch should be the mail body and not attached, git send-email 
should be able to get you through the hoops. I've seen 
https://git-send-email.io/ mentioned in various places so maybe that 
could help you get started.
See 
https://lore.kernel.org/lkml/20230417065005.24967-2-yu.tu@amlogic.com/ 
and yours: 
https://lore.kernel.org/all/f147dabd-5c39-31c2-0ff0-f72745d7cd3f@gateware.de/

In yours, you can see
"""
[-- Attachment #1.1.2: 
0001-usb-gadget-u_ether-Fix-host-MAC-address-case.patch --]
[-- Type: text/x-patch, Size: 812 bytes --]
"""
this is not good.

The point of the mailing list patch submission process is to allow 
in-line review, people will typically comment in-line directly, see 
https://lore.kernel.org/lkml/20230426111358.xh3gbhlvxj46ggi5@CAB-WSD-L081021/ 
for example. Adding the patch as an attachment doesn't allow this review 
process to happen. There also are a few robots applying patches directly 
from the various mailing lists and running some build tests 
automatically, I am not sure they are developed with patch as an 
attachment in mind.

c.f. 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#no-mime-no-links-no-compression-no-attachments-just-plain-text

For the "i'm not so sure" part of my mail now.
I don't know if this matches stable backport policy but I believe it 
could/should. So maybe add:
"""
Cc: stable@vger.kernel.org
"""
before your Signed-off-by, c.f. 
https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

I think you should add:
"""
Fixes: bcd4a1c40bee ("usb: gadget: u_ether: construct with default 
values and add setters/getters")
"""
since (I believe) this is fixing an issue introduced in that commit.
c.f. 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes 
and 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#describe-your-changes

Cheers,
Quentin
