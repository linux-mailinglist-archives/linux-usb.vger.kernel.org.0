Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C093A46E7F6
	for <lists+linux-usb@lfdr.de>; Thu,  9 Dec 2021 13:03:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbhLIMGx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Dec 2021 07:06:53 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:47743 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229866AbhLIMGx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Dec 2021 07:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1639051399;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=fWOvARgdztuto4yui4qLJs2/EWHnv7/U3KPE5LnzOwk=;
        b=Z4idecOJ6+sgPrLaF50S7ailvKOeTjq/4qIB/bKOLeqn2vUq49IUjcMk6fcMQsAHME7H9P
        f+8j4qOluCFV26QzbuXkCuMBkQV1Qjrw84Wo1O7HHfZesQQcNz6J9l9ezecGrQEwKamWPi
        LPNBA1TdTSGwKj52WPxd+3IHk6W5yUY=
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05lp2113.outbound.protection.outlook.com [104.47.18.113]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-10-9xf9mDb5PoSsulkN11gZDA-1; Thu, 09 Dec 2021 13:03:17 +0100
X-MC-Unique: 9xf9mDb5PoSsulkN11gZDA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LULbmF9uo0dvpe4Sy86LeGzcYlQJhJ/eqL4Vv0LFCcQTXwuLHQafQ1rgFYYEaq5g22sjVZBhBmDz9ZE8e06pJ+5i8M2CpP/MspI7UPEtn3vQmUpLtKO3jiyNS+6WP9XQTqUNzpq4x6Mhv/fqf+VrhKyyaBj0sfd9J/NemxQNEQTlHyouqstcnN1ag0rCwnZW+3jv+oHd0Kngdw1zRfJFCagKPasRNO/3GyQ0d24ohHenqd8N6rZJG+oX79r8RUQTXmrUtXqGH3B4udq2U9NYKqnU7umsUBquirLTRucbKjt3MzVYcQgZxFGJAxnZiG9Y8NQYzq6W7KU7N598P/FKVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fWOvARgdztuto4yui4qLJs2/EWHnv7/U3KPE5LnzOwk=;
 b=Ag22+bUs/yfzyzymobLvW7EytocGsdqtEf8JSFIkHKr5uj7HxVcy5qI8ThYsev7Ah92RRqh8MpvbdyMnS2p0MoZdq4suVLgBIVfuosXfgjOHF5nQvhTYXBQcKLelNYnoy9RlG4Oty2s3LGqTnh7yNGtvFJo9hVtUw/VnJhWF7sudmuYrpz5DPRHQGzaKA3Il9wzXw2DM/9E9nXiCeuL7gzqt0u/9HnV2q6kuBhZVFxjVZgxQTSVsGL5OB8Qc1XDkVLDmU5siGUunZYbe1K2hNofK/HAX8heWH80jgriQaOeG/D+6cqMIPYbVZpJvbnX/bXuk0/jAGVKnKMpagWb3Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DBBPR04MB7803.eurprd04.prod.outlook.com (2603:10a6:10:1e5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16; Thu, 9 Dec
 2021 12:03:15 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1%7]) with mapi id 15.20.4755.024; Thu, 9 Dec 2021
 12:03:15 +0000
From:   Oliver Neukum <oneukum@suse.com>
Subject: Re: [syzbot] WARNING in usbnet_start_xmit/usb_submit_urb
To:     syzbot <syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com>,
        kuba@kernel.org, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
References: <000000000000a56e9105d0cec021@google.com>
Message-ID: <291da1b9-9f71-0f99-45f4-a25a259c8d6d@suse.com>
Date:   Thu, 9 Dec 2021 13:03:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
In-Reply-To: <000000000000a56e9105d0cec021@google.com>
Content-Type: multipart/mixed;
 boundary="------------5280D93DF995F54F1C0510CA"
Content-Language: en-US
X-ClientProxiedBy: FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1e::6) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
Received: from localhost.localdomain (2001:a61:3b82:1901:9d6b:5ffd:1b6b:2163) by FR0P281CA0076.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1e::6) with Microsoft SMTP Server (version=TLS1_2, cipher=) via Frontend Transport; Thu, 9 Dec 2021 12:03:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ed96e828-ed06-41fd-27fc-08d9bb0be154
X-MS-TrafficTypeDiagnostic: DBBPR04MB7803:EE_
X-Microsoft-Antispam-PRVS: <DBBPR04MB78033CF8082BE33B7F5E9757C7709@DBBPR04MB7803.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j4xf6LYjzg0MqduUe44rz+Ov+mfBW6gmq+Jzg7NjwLIVHO7xugJXuicZx+mgn83VBsMWdhSnF5j5J0x0XIPlvm/SiBy29qKBkJjClgb6PIkMKj2WfGB1sagR2Gjh3NcnpiX5AR65SjhJvWXRuwsU2MOWMT8Z+PLIFZ8h5EZMszXvuTxxrPHxYDINsQ0tqLCEKw7a5a1wf9+652GPJvmApy01141+tPScpqeGaAsNjb0p0IhWZwDm579/6D/DxrffaJtWxoxtRgyqZcI+7SqHfdT0DVrcWsXN1liHKhVuP+EaMx5apcBqVRaqFW/AuLvhiG5DoX0kpc5XobL4CZFhtB++WnVCL5AqQj/WQli+p/qNIQrJcFCQcvYe79paGUy2NncIQh34q9JMHPncD2ELWTBL72Dm3+SmpaDFpiefHf+bWNqSiUlSm+SLQ9MQeSvN8aM3MGw8Ce11EGVM0NUgd96tLrw3Xk8nL23xbvPRBqQNtu+E6jKX6VjVC5OrVZHWCZm1g8stIntZpg/8D0zd6dFUUpgu29lDm0DU02ql6/RpevQPUtIgkJvAXGSk4JlfqqWsTUeKxO0wAn57lnVmXhSWPebC8vzkUYMVkN+UXW1SS594LDZU/4f+v4k5jaj5HEOqs9GrLe+rgavHwTy28iyuN5ec/9ttB00Gnykb0ARtvYpuIgBaeJJtI0U8mdHzqnqrlIsTsjUxT7VNj2Hy9K4I6AWfFYCEyt0xyf/cXGOeFA2Q3iYjElGMwP2QrNOgm4nW/2sjDIxZqyn7OGhI3p1ZVVGAffYU7DFowRpQjX/xFaJDb6cOo0aCVyd0QrduZT0B2wDZH1p/KRNxSmFhWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(36756003)(6486002)(508600001)(2906002)(31686004)(8936002)(5660300002)(53546011)(966005)(6512007)(6506007)(31696002)(33964004)(8676002)(2616005)(235185007)(186003)(66946007)(86362001)(316002)(66476007)(66556008)(38100700002)(99710200001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVhEeXZtQ3RKK2xhK0hMdUxPVDZjWUtHeDlEQWVycjlHY3RDYmZTbDJ1TXI4?=
 =?utf-8?B?Uk9GazdHcHEyLzQvUU84WXFPZCtDVFBnYjFHTmQrQmNzM1laYWpXdEFBajNS?=
 =?utf-8?B?ZUFuRlFrQkkxbmp0Qm1iMm4way9GaTJxU2pLakhoR2NKeklNUmJTb1ZzdEhy?=
 =?utf-8?B?dnFZc3lMelFvLzVBUWt1di9saGlpNkFaUjZJTDJRUGx4Y0J5Y0lJWkFPeGF2?=
 =?utf-8?B?UEswSDZoK0VFSTlDYnhScXZyQmZyN3R0bWo2NWdnSjdycC8rQm9EK1Zmckd5?=
 =?utf-8?B?WWNYaE9uc1JHZUIrNS8wN2ltNk5URkVuSldUZGlTWGxZVXo4cWFuSVZsUUdK?=
 =?utf-8?B?K25LOVd3QjBydDBQK3hmUWNJTUFRY2FsY2lNMWl0WW9PRisxbTBwTVZzMTRt?=
 =?utf-8?B?bk5lSXc3Wk1hWHYweEUxR3l3SWpsRStXemNrR3FKeXRnaUhFZlhRVEh4TXJY?=
 =?utf-8?B?VTJaUVBUWVMzaG8wWWxuUHk5VUthTTQrQUR1MlNXZFhnbmdXOGJ6YnR6cngy?=
 =?utf-8?B?c1lUUlpFVUk0VlJ6cjZyME93NStmZkxWQzU2Z2Z6U1QvSngxYTJGTE5YbzlS?=
 =?utf-8?B?dUM0cmhDdStaTFl3a1JYcFRxM2x6bmR2R0hHSjcwSG16ZmkzVFNjMUpQR3Zm?=
 =?utf-8?B?YTllZFY0MkFzYnc1OFFLY2hVaVJTNERyM09CZ2RMSzlvUlpVYzBBR3UrcmZ1?=
 =?utf-8?B?S0haQzBHRGM5ZmE2bXZjaS8wVXk5NFEzbWhGT3o1cHVmVjRaU2JDNUorTUJ2?=
 =?utf-8?B?NGYzTG5PcDVDalVsbEdHajZ1bzJmOWJxaHhqU1p4dkVvaUswOFU5ZlR2V2FD?=
 =?utf-8?B?ejgwajZXS21xTVBsUlJtWUFZSzdQTTRvVUNwRjYyMkp4d0RIWmxwOTZRK1dz?=
 =?utf-8?B?eURIRktXU01xRSt4YkNXZnFpaXdIeDNYSXB1YWVudWlRMk8wV2JxSmRtcjFJ?=
 =?utf-8?B?U1Q2UEpTTzNnYk9CN3Yvd0dnbWNqZEloVEkvWTdaMGlQQmt0alZqMGw2SzNI?=
 =?utf-8?B?RXNWblRlUSttSHFzTWxBa1hoc0J1aExOdndPVUJ4SzZyNW1SYVZrd0FnV21N?=
 =?utf-8?B?ME56N3lsQ3FTRFhUcVpiQ0hBYkl0ODBTN3U2SnJOY01WNk1YenZIeHh4Q2JD?=
 =?utf-8?B?NlVod1QybHRneTM0TEdhUjJqenNnZ0RRQjd3dGdabmg1VE12YlZTSE5XTlZW?=
 =?utf-8?B?aVhFM0hudDhYeGw4TzI4MmpVRWZDNG0xT0FHcnF3aW13RFN0MW5jSEkvMXI5?=
 =?utf-8?B?R1VGWHluazFwQVNFQzNwMW8yTTczMWJnWXRTUXNMcllaTURYZ1Z1akl6Z2JZ?=
 =?utf-8?B?eE9rRWZjVmpCNVZJNlJVRGsyQkdxL2NWL3ZHb0FmZERRUm1wbmNoZU1VWSt3?=
 =?utf-8?B?KzR0dXJwa1JYWDVHV0ZWQmZ2UE9FY1lYQjRtSDR0aVY5c25yM3hCeUZCMVhQ?=
 =?utf-8?B?dDFOR2Z4WElybFN1V2w2eDJMOWZmNVlSZVhRcFo1cjBnOWcxbVRUcU9pdDlB?=
 =?utf-8?B?R0M1SG9xT2hROUYyNUgvT0lBQ2dxVmtVSXZ4UUgvN1JCa242VXhxSFhjMHhZ?=
 =?utf-8?B?UmNPMGZaQjRRakxHSHNRN0cyK0swY2tlc0dYdU5EU1U4dU1OdXlsYmdCaFZ0?=
 =?utf-8?B?UGx5SFE2aWRyWFY3WmZGbjNjRktXdUQwNVppNjVEWWFCcjc0TDc2dEdnZ3dh?=
 =?utf-8?B?S0N1NmpDVHRaWGd0elRveDJMOUZMTGhQY1pHSnNaZlpLTTZlS1BGZlV5dzN2?=
 =?utf-8?B?dmw1bVNNemM4M2VTbjU5UGlGZEczREJVUzRwY0dybXVibEVPSkpMcld5OUVK?=
 =?utf-8?B?T3g3dEJJSTZUc2ExZjNQaGd5dkZIWnJmQ0xoQ2FHNUZRWUZMaVlEalRaK1Ra?=
 =?utf-8?B?RWxOc3R5eHNBYjhCdFJEczBDeHdsRmZmVUQxbFNyclJEWGdaUUVtampsZHFq?=
 =?utf-8?B?djJRLzNwQi9yOWdTMmh6V3hEOEVDRlBhK29mN1orNkNqTE8wKzcvZkdHdkRm?=
 =?utf-8?B?aEI2a0syTERNQ2FObXlpL21BcWR6bTV0aXVJbmxmTFdETzhuZCtRMldYT1po?=
 =?utf-8?B?dTVZenJvQUxKRVl3bFJheUVxMVQ1S0FZSzlZRTJZRDA4SWJMcTRvbjBjTVZs?=
 =?utf-8?B?dGc0VW9XVVJXK3FOQ3dIcWRMQTNybU5rWmZRTjBhcG1xbDFFZDZ6azkxTXZE?=
 =?utf-8?B?UXZaaWFsQkowN1p4dUFxNnEyZUhER3JMSFRyV01keXNwTFYxRnk2ZXBLNVdh?=
 =?utf-8?Q?xF8vQBFLeqV6ilnhOkyv1VSw13dS+HysZOzGFk255k=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ed96e828-ed06-41fd-27fc-08d9bb0be154
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2021 12:03:15.4306
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vf9PW59tVqwJjJjJFLqgNaBainNDUB6ddOLoFBlyCt/LSCqTCmukl7tDmfZXelHA7ReVer+pL9YI9qCpzQY4Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7803
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

--------------5280D93DF995F54F1C0510CA
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


On 15.11.21 08:28, syzbot wrote:
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    048ff8629e11 Merge tag 'usb-5.16-rc1' of git://git.kernel...
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=1480ade1b00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=d6b387bc5d3e50f3
> dashboard link: https://syzkaller.appspot.com/bug?extid=63ee658b9a100ffadbe2
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1313cb7cb00000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16a2f676b00000
>
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+63ee658b9a100ffadbe2@syzkaller.appspotmail.com
>

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git
048ff8629e11







--------------5280D93DF995F54F1C0510CA
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-usbnet-sanity-check-for-endpoint-types.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-usbnet-sanity-check-for-endpoint-types.patch"

From 853e421630f82fb3b7005ad0b294c091a064ac39 Mon Sep 17 00:00:00 2001
From: Oliver Neukum <oneukum@suse.com>
Date: Thu, 18 Nov 2021 18:15:03 +0100
Subject: [PATCH] usbnet: sanity check for endpoint types

A malicious device can pretend to be a device with a known
configuration of endpoints yet present endpoints of the wrong type
or too few or none at all.

Signed-off-by: Oliver Neukum <oneukum@suse.com>
---
 drivers/net/usb/usbnet.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/net/usb/usbnet.c b/drivers/net/usb/usbnet.c
index 9a6450f796dc..b1f93810a6f3 100644
--- a/drivers/net/usb/usbnet.c
+++ b/drivers/net/usb/usbnet.c
@@ -91,6 +91,31 @@ static const char * const usbnet_event_names[] = {
 	[EVENT_NO_IP_ALIGN]	   = "EVENT_NO_IP_ALIGN",
 };
 
+bool usbnet_validate_endpoints(struct usbnet *dev, struct usb_interface *intf, const struct driver_info *info)
+{
+	struct usb_host_interface *alt = intf->cur_altsetting;
+	struct usb_host_endpoint *e;
+	int num_endpoints = alt->desc.bNumEndpoints;
+
+	if (info->in > num_endpoints)
+		return false;
+	e = alt->endpoint + info->in;
+	if (!e)
+		return false;
+	if (!usb_endpoint_is_bulk_in(&e->desc))
+		return false;
+
+	if (info->out > num_endpoints)
+		return false;
+	e = alt->endpoint + info->out;
+	if (!e)
+		return false;
+	if (!usb_endpoint_is_bulk_out(&e->desc))
+		return false;
+
+	return true;
+}
+
 /* handles CDC Ethernet and many other network "bulk data" interfaces */
 int usbnet_get_endpoints(struct usbnet *dev, struct usb_interface *intf)
 {
@@ -1772,6 +1797,8 @@ usbnet_probe (struct usb_interface *udev, const struct usb_device_id *prod)
 	} else if (!info->in || !info->out)
 		status = usbnet_get_endpoints (dev, udev);
 	else {
+		if (!usbnet_validate_endpoints(dev, udev, info))
+			goto out3;
 		dev->in = usb_rcvbulkpipe (xdev, info->in);
 		dev->out = usb_sndbulkpipe (xdev, info->out);
 		if (!(info->flags & FLAG_NO_SETINT))
-- 
2.26.2


--------------5280D93DF995F54F1C0510CA--

