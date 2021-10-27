Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F0EFB43C6DF
	for <lists+linux-usb@lfdr.de>; Wed, 27 Oct 2021 11:52:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233819AbhJ0JzF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 27 Oct 2021 05:55:05 -0400
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:41193 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237089AbhJ0JzD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 27 Oct 2021 05:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1635328355;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=a+KElWhE350Kq8vKUrwISNKYV/hLWEzwSNzkZvJXmkw=;
        b=HpRO4mVl/lvDoPYyxdl627fKLL9IpvgbZo2U1lQmGBdhdDqRYOeltzvVZVh15bPBklIljT
        qIVqArJTJPkV0l/Br1i/NqgWftrfZnk1/dCWT2ybGVfsA5q7jAyg/uP+5NF8EzrRvdwKMX
        oYuFYRVw9L5Lrmpot84JUsAu0jICrN0=
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 de-mta-34-2STKstPjM02DGwgsq-waOw-1; Wed, 27 Oct 2021 11:52:34 +0200
X-MC-Unique: 2STKstPjM02DGwgsq-waOw-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkgPjhjjfdsPtJwdItUXhh0EJJ8wNFAOH6CmJ8GjceWSxqktfGgTdRzGk210XLPS/52BZJG82xoJQjsbNMp3i5F/mXrwMbiGYxi+FPberdPNPGgZzKZc/eaMetH5UkTx0yTFeaYecKWXuvj621KSuLR5DPkoMmRkELwMeZZ3AK9phdf+CHccIldZ6FNvksAaIOZEtuipOmJvQnW4hJmmb8dn2+DVhAbCHo4cVoErh2uV2kPcdaXVPOGnAPAkeSV5dCzkTYHNfNNxGCa+pqQ5mWWWaYvcx3Fe+hP2LMv3zE8hA3j0lI8a1VsOVx8mFEHxkZHP2Ie33mjufXdi0d1rzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+KElWhE350Kq8vKUrwISNKYV/hLWEzwSNzkZvJXmkw=;
 b=ekckEl/ZP9OhFc+vI+bBSxYEGLohTuQY5F5bU3kpme7ybsKI8sUTHQ6+DG6XUTRjZ3+72cs96M/yufNXrq+rZmcGQgu+gR2RXPGmEnUyP34GL9K27BBQWJQLBaMq7s6iph7gRoSdj9jtVzT+aMoLuxqGsEDDSphun8VwxNUkNBPbljQcizGOjPdAhajLwi5YodNBH6XRVh6OlFNhBqflg8u9y0CiPz2xsmG19uDB45hlafEo9+ZKwT3+JSFumff4nnUkXwrPxhzC+wA7jTUZybsuIPYSLxALrmHxLagIQ8xob5OWKJV3PKPmxPrjobPDi1L0KeIuVYoFkrzSWo6+gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB8PR04MB7145.eurprd04.prod.outlook.com (2603:10a6:10:fc::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Wed, 27 Oct
 2021 09:52:32 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::61c5:2592:9e7f:a390]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::61c5:2592:9e7f:a390%5]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 09:52:32 +0000
Subject: Re: [syzbot] INFO: task hung in sisusb_open
To:     syzbot <syzbot+fd9d03311cdce9a9ec36@syzkaller.appspotmail.com>,
        andreyknvl@google.com, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com, thomas@winischhofer.net
References: <000000000000c87fc005cef26865@google.com>
From:   Oliver Neukum <oneukum@suse.com>
Message-ID: <bf8eefe4-7fe1-002f-8258-10a3e825856a@suse.com>
Date:   Wed, 27 Oct 2021 11:52:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <000000000000c87fc005cef26865@google.com>
Content-Type: multipart/mixed;
 boundary="------------3C26927F8DFEE6E3DEF898CB"
Content-Language: en-US
X-ClientProxiedBy: FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:14::16) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
Received: from localhost.localdomain (2001:a61:3b0d:4601:21ab:d1da:15e9:ca07) by FR2P281CA0029.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:14::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.11 via Frontend Transport; Wed, 27 Oct 2021 09:52:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6d509054-ef9f-41f1-1a9a-08d9992f7ee0
X-MS-TrafficTypeDiagnostic: DB8PR04MB7145:
X-Microsoft-Antispam-PRVS: <DB8PR04MB7145C4F262F7D2D3C7750FDEC7859@DB8PR04MB7145.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:418;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9W83R5//QN8FH/EFXH9RUebNFKhWV26HHEJZesW4ExSrLXVSEM+n13/hHnuGxW6Iin1DTh5Rrg/cDp1WJwIgB3mNpCa3FSnl8TJ9FThOXvdQgWiEN+YJVy7WBZzO0Ws8AI2LW6s2O0h/FNG86ePvIX7dQC3YxVWB2NkLh/mHVNtRA6H7H6byoeoMonSMkrrdu0ASZR7gvy42NZmIjLkgfTUZXN2ye4BU4bGDssNuCWwncsnwPmP+2R9Vv4tqdGpdpZoDF999nMgvzOsPa/dh8xwLytOElBAATA93UFBOFodiaxLWtubNCBON1ojGV0XPSG0Kr9ZWYdSGM0YjcOGUvvF2wsSC30tlVwduzM/p6mblsMDOiAPg++cfMjjiGvWHp2t1VMiFZNyANt2k05OSEuLnH3LxRRvSRg9coGzyOZgj4IKw4/2Gbwhi9n2FjfxNfvbc6RlolFzeGgGIqUmL+Xgno3I79LpACGHolODfah7JSzlE/G1+pxSYRvilMqnpi6VYsWx7AEKv9AbEIzPJa+krN09MuDOlEeDGrl+bEZTnuE5VJY82OfiH0xORdaUSJA5gPPnYVr0Nl6TuQI8OMbil+qLZ9L2EWxdVZ64XCcnSAtKJEW8eWDNopTfLVW98Xj2OyD13dwxNYYhz4JZgx1FSSU3ddojfH5cigikWKsyXyqb03DzPa5yWQ3LEEmsLPVIoCAK6q1UpJSRYcAvKLZ4eVfzhwLJsr29th8i+QJHb4aztjG9jCErWyAU/4Yo3a4FGBp1AeZ8YvpX64c1vifLpbar8qBh+vbEp64pm3waUNRg1ma1aVhLxYHfRxzvni/J2Ty0qKvSNIy9DnE+C9oR2BKI0gys59DEmwpKVqXaNw2dfOe2vz5PEX+6dwj09
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(316002)(66476007)(86362001)(53546011)(66556008)(66946007)(31686004)(5660300002)(2906002)(2616005)(38100700002)(186003)(6506007)(508600001)(6512007)(966005)(235185007)(8936002)(8676002)(31696002)(6486002)(33964004)(99710200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blIwLzBlNGt1em1KUTMyL0FTSzhuOE5OMGRQV1QwYU14Uk10TzFLV2dSQzBS?=
 =?utf-8?B?akFNZGwxZ0RqYmhNL1lLSXdTYlR5RER1Q2xsVk5vSXVnUGxLT3U3YnhCYURz?=
 =?utf-8?B?SGxYSzJYeTJvdnNrZ0hiYnMzVWdYblduckRqSUFLRmhpVVRWTDlYcVFvTHdi?=
 =?utf-8?B?Sndsc3NRbDg0VUxWY0libzJGWjZCS0tIRUFYZE91OEtWR251MllBYkpWRFFP?=
 =?utf-8?B?aGF5M256eG95Y281MVlLUGdJRDdzOFBDaFJxQ0Q1RHFTNnpRSnNIY0hGNTVF?=
 =?utf-8?B?aUprNFhocUo4c3M4ZXpKMjJYQWw1RndreWs3ZkFuR2Q2Vm1BRVpJOHVQeitE?=
 =?utf-8?B?c05uS0Y2akxvZ01oVFROSWpFclBHc0YzdjhYeVZxM2ZZeGNCNFB2NGIyTXo5?=
 =?utf-8?B?YlAwbHFBWkwyN3VsUU1PdzdwK2ZvazQ2dTd2dHdlL0VMSmRwTkxTU01kYkx1?=
 =?utf-8?B?dHNEd2ZlVGU0bXNGYkdCNkR2aUhaRjVXbzd5Qm0yV3U3VnFZbmhRMlBYUHZN?=
 =?utf-8?B?Sm9GdVB3MnJFQkpYdGZ1VUcwSnpYWHVVdVBuVHNrSmtzMkJ5ZnRUQU9aRDQ4?=
 =?utf-8?B?R3BxMHY1Y3IxSE9mY2FscFFZNmtXZ3crLzQrMDJnSzRPV2k0NVYvNDJYK3ov?=
 =?utf-8?B?bmNzbWtZWjVsUnV3WElrb2xQL0N1RlpMaWg0SEV5ckdEeFlBN1VsWEFDaTVI?=
 =?utf-8?B?SElyN3BQendFeUU2MXJJUGtzSlZvSUFHby9KV3Q3TkNSaXVmRTJxL0NMNTVq?=
 =?utf-8?B?alhyWnJFV2h1NUNLdWZsNmczZnYycWFUT2JKV0tscS9yODAyT0Iyb0xaRUdl?=
 =?utf-8?B?ckJreGxsMUlGL1ZlL2VRTkVHYmFhbkZKSUcySGU0ZHhPV0RYWUszL1pWRmhX?=
 =?utf-8?B?VmZOR1c5MGZ3ejgzOTMyM0NMUXZUdkF4VE8rM2poUEtidmNrZ0gxbE8xUTdM?=
 =?utf-8?B?ZEplTjFBNC95alM1L0NOL1luMVkyaGFqcEc5Nk80dkgwbEJhVkordXA4WHJk?=
 =?utf-8?B?SktmdFlZSU9tVDMrMzE4VnljK09zOVE2Q2V2aTZGS1B4c0FxTXdHMHNCUDRN?=
 =?utf-8?B?eHlvRW44akNJZzBDM0Z6dXJDRzZXMkl3WktaK29rUFlJK0RscGxOdHRSUmpO?=
 =?utf-8?B?R0JyQUFNSUp0cG0wdjhXSFJtRnN1dk5TZmdUQzY1YjhSdlBnTlVxZkd4a2kz?=
 =?utf-8?B?cGpJTU9UTVNBYUtVVHdkVTM3NFUyMkVTWnEwbW9uck1lTk8yYUthcjVINzhO?=
 =?utf-8?B?bitXbnNOaEF2Y0orTjhHejZrMTZ2TjlQdFp4bG5JdE1GNC92UWhMMEttaFdW?=
 =?utf-8?B?Qm1IN2s0VzVUUkpZVTZZOGJUNFNlcFJ1MEt3ano0RzRiOWJJSjlvZXNOeW5X?=
 =?utf-8?B?MDNjdC9KODQrKzJ5L3ZuU3QvZkFJS3gxNURacmZPQnFrdVhWT2JSZXQzcHVT?=
 =?utf-8?B?d0d0S0JwcmI5NCtrTVd1V1lCS3VhNG5tMDBxYngyZTZKZ2lVTlMvRFFRblVU?=
 =?utf-8?B?RW5vVVBOL21WNlcyYnNPNUNKUFVsS0p3azhGbVVONGVZY3pTTzFuTVFjbWtO?=
 =?utf-8?B?YTNVd2RITVdTcUNRYjVhMzNlZkViY1JRT29FRmorZUxFZDJBK3pvbksxTmR0?=
 =?utf-8?B?NXhZbVBMb2Q5ZkI4RC9NbDVndmlURk9acm5TK3NHeFZFQ0Rwb3dVWmtMVHFx?=
 =?utf-8?B?YmJIMTFqbVBsVjFSYVZHRmNjVEZzOExrV3BLcEtrZG5acG5lYnVkcll0cTVo?=
 =?utf-8?B?S2pKM2ZHV3hIUU8ybUovNlpqY0lseUxrV2JWekkyOFM5RURYVVA1VVA2VmRr?=
 =?utf-8?B?eW9oVXllVVQwR2pqNE9raU13aU1DVkx2dmVjWDFLeWJZcElKUDJGbUNaRHN3?=
 =?utf-8?B?eGxXMUx3QTlWM0VoMjNDbStPakl5WDlqWWFxZFBiVnpvWkppY0p2TEJ2L21B?=
 =?utf-8?B?QW54UWt4aUZCcGJBMnhJajlpRzZMVHJDaWRSdW9IdHRpMlh4Q05jeW1nR1dE?=
 =?utf-8?B?ZUVlVDQzYUdjY29IelJoNGlVUHYvVXB0U0RQM1B1K3JDRzh0QnIrWnpMZVhy?=
 =?utf-8?B?VnNxdzVLOXh1NVFHU01nNWJZMXFJaHdjSmVDYmNiZVZVREVENmd2aGpUenFn?=
 =?utf-8?B?NVVIOCtVdlhmN3hMQm5iY3N4K0RpUXQ3ZERUTWxvL1ZJcndLc0Zxa3pXL09G?=
 =?utf-8?B?VGo3Vk83R0pkSTFSRG5ITVZQRWZ1dXF3TmF5THRlV0diZXRRVjB3a1F6MHBi?=
 =?utf-8?Q?Z08FAm7xUXFTeLEbl4egt0lIvcLfrNcl3Cw4ZdbGI4=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d509054-ef9f-41f1-1a9a-08d9992f7ee0
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 09:52:32.3882
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jk4RrC3w28PFXFohFR9h3f+gPPqWIuwS6xSYd7OdKLEZzoJvNZGtG96VBr6pmDMWWmLCLAl/l40pKq8b9tIDVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7145
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------3C26927F8DFEE6E3DEF898CB
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 22.10.21 17:10, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
>
> HEAD commit:    2f111a6fd5b5 Merge tag 'ceph-for-5.15-rc7' of git://github..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=15a3aaf0b00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=61f4d9af07d3bbdf
> dashboard link: https://syzkaller.appspot.com/bug?extid=fd9d03311cdce9a9ec36
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13d4e9fcb00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1444ada4b00000


#syz test https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git  2f111a6fd5b5



--------------3C26927F8DFEE6E3DEF898CB
Content-Type: text/x-patch; charset=UTF-8;
 name="sisusb_debug.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="sisusb_debug.patch"

diff --git a/drivers/usb/misc/sisusbvga/sisusb.c b/drivers/usb/misc/sisusbvga/sisusb.c
index f08de33d9ff3..de30fb85ceda 100644
--- a/drivers/usb/misc/sisusbvga/sisusb.c
+++ b/drivers/usb/misc/sisusbvga/sisusb.c
@@ -251,7 +251,8 @@ static int sisusb_bulkout_msg(struct sisusb_usb_data *sisusb, int index,
 			retval = urb->status;
 			byteswritten = urb->actual_length;
 		}
-	}
+	} else if (timeout == 0)
+		printk(KERN_ERR"Message without timeout\n");
 
 	if (actual_length)
 		*actual_length = byteswritten;

--------------3C26927F8DFEE6E3DEF898CB--

