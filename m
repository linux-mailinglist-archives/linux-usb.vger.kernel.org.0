Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2F246B8A6
	for <lists+linux-usb@lfdr.de>; Tue,  7 Dec 2021 11:16:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234950AbhLGKUN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Dec 2021 05:20:13 -0500
Received: from de-smtp-delivery-102.mimecast.com ([194.104.111.102]:31366 "EHLO
        de-smtp-delivery-102.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234952AbhLGKUM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Dec 2021 05:20:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
        t=1638872201;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Xh0TQGssOgRMz9zzaOUNwtFShVqjyAkUQuVLfj5wUSE=;
        b=mjgpymOsX0AAnS7VWl6J16LXBvGvtmxI6+5jmUWPczTL1+X/1ffwBcW9bYy0HB5Hs7VKMZ
        Lml6EFZElbTb0n4SWxJQRpA9y/uv2qsFICyxkDZL06piubK1ROrU5V7pvkFp9xZlqk4SPM
        hV8bJ3d30eP6SEltFjdOQ55TM2w8qLI=
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05lp2111.outbound.protection.outlook.com [104.47.17.111]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-30-Exc4C5AnMxmLF3CvGh3Jkg-1; Tue, 07 Dec 2021 11:16:40 +0100
X-MC-Unique: Exc4C5AnMxmLF3CvGh3Jkg-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S9M271QdB6ySkJdSU/UPOWsUa1J1xMJZJJVL5wgBd5KTg5fHa+ODx5in22ZP5DFhvWE9TyUDpdRvIDnSktJT8gNcROGfDUF8OzRQNGYS37z2UzfKGMKn5DkrC+b3iqK84+4rj1QtchMEgxLoRxRPl9j93X2d/nzfV8nCvePh0Wwmr7DUmBzhbyYAjv0VkR7icwNbQXZx3AwH5zirGTdgjujhl1CDL3hIu5aoQ5J/lUTwjVqSI+T1juiWPyOA5JqalG8SBI46YYx/JT57mYNoz1r0HHNBQD3iU5RoYebuSRt7OOJvpI3AQvpWVZjXhMyZcBwxxtURkZOXkaLqagr1zA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LQ8RhPjn38/2N5oIyGWF15iAD4jyg4tU4r2+SvtDYTA=;
 b=Andhz3Kw21k1o+A13fOwK+ZIP3wwkAfOs2tl4YcjrrHE2hKJdXiL3thtRam5pd9I0Y4DsrCnRaAii8BHhmXfTB993r0XxzbixWEox6jP3uv9J3ptZ+40eahbxL03DmfrntFUhIpQ4xg0jLUTbEeHNA0A7MZzK0wFLn4DoNPnu4eHDBgE3dNIh9piu/tpCGXC2RT1//SxmgsMDERi13uGnn6TUHkD4wfmC3YFJ7Zn7P7sNfLmJ4dEAOkryFzLuiUbcelD+k/00Q5UnPWMEVJLbXhrCBkAMchA5N9zQoBI89+f0UoJQbrV4zsfrEF4U3TEA3buG4S0ppKRGaUNSi0IcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com (2603:10a6:10:22::23)
 by DB8PR04MB6810.eurprd04.prod.outlook.com (2603:10a6:10:111::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Tue, 7 Dec
 2021 10:16:38 +0000
Received: from DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1]) by DB7PR04MB5050.eurprd04.prod.outlook.com
 ([fe80::e9d6:1be9:d046:af1%7]) with mapi id 15.20.4755.022; Tue, 7 Dec 2021
 10:16:38 +0000
To:     linux-usb@vger.kernel.org
CC:     linux-doc@vger.kernel.org,
        Philipp Hortmann <philipp.g.hortmann@gmail.com>
From:   Oliver Neukum <oneukum@suse.com>
Subject: proposal to delete the skeleton driver
Message-ID: <df5bb0a6-e5f5-e062-5c02-e1de612058e2@suse.com>
Date:   Tue, 7 Dec 2021 11:16:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
X-ClientProxiedBy: AM6P193CA0122.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:85::27) To DB7PR04MB5050.eurprd04.prod.outlook.com
 (2603:10a6:10:22::23)
MIME-Version: 1.0
Received: from linux.fritz.box (2001:a61:3b82:1901:9d6b:5ffd:1b6b:2163) by AM6P193CA0122.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::27) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend Transport; Tue, 7 Dec 2021 10:16:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c50cff2-6f0b-4e41-e3bc-08d9b96aa7fa
X-MS-TrafficTypeDiagnostic: DB8PR04MB6810:EE_
X-Microsoft-Antispam-PRVS: <DB8PR04MB6810D5829A0576A7BDAD9528C76E9@DB8PR04MB6810.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jvpapOoYgxoKBVTewQjUktzc1NO9lLDrK7jLCD4rFaElVllVZj9sJkisC8T0ozzz7Vkz6refs83riw08ST3iMFdEal8BJle4s8yv9XYL7TtMzVSYLB4nDHsH3rSl396vh6lBhoafxaqC/ze0qPm7K4hKi7AfzG5iWkzJ0N7o7kl4xV4/pHJ8hO984rTSUr85VMicm7ZCMHjv0J5RUgV9jOFIbSGBq1UuOMq4XO2OVqvrzSDDJsF3nKQ6fZNZysBpaHbQTvmZ7b4aVWPyWmc8nckWDu6u415QDTUDOba46814QmnHErhdAGr7iTApWX01WuhHahWGmA+NjVLb1DTRa8tR+yDswGuV5emVgKBJwtuEL28MifCKjj9TKRq+efrUL1ep49XO/WTyOMaLkwKHNPbdESiEsUt+lwbxtfF/Rt43TFgQi2B9dRsrNoJ9PLXdvW3qMF5I1hhQ3W9MIkJdqyUcwqPTrTLLftyK/o0Zf8QtBBaYxXaR59oMFoUx7bAhQQI0pM0Wb4wyE3Oheh1lZX2VlBMW+Vnrf7n7/ftpmu192tu/ZP+/3ieCk5Y96q+erUPKi6+sagjTRfq6/WGxPDhRqYFun8Tk17kDFQMAtaP+Lu0zOrVZutyCjkQvSWbJ90XaHPSQ0A+lsRiUHB4PBji0orbDTXqd+mz/pdYZw2sdkeqUxOxEBw8n8fj7g7m2W0tiZwU09DZI01bO2iduS+90f9qqksV87X5wqWzDaFsab8RXhKbveLtBjr/OF8nv
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR04MB5050.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(31696002)(186003)(8936002)(5660300002)(508600001)(8676002)(36756003)(2616005)(6506007)(6512007)(86362001)(31686004)(2906002)(4744005)(4326008)(6486002)(316002)(38100700002)(66946007)(6916009)(66556008)(66476007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?M66ClPbicJrj4A7rLkVPn2rrmR8+thYt3Y1hB1FsnsJsH4kPHM89/QGoBgdE?=
 =?us-ascii?Q?hMpK/254rgL4qhWz1fZ6ZJdvmaKbVTu9vF1P6FnTOaz1OytRgNLmhiiVeq3D?=
 =?us-ascii?Q?Gh8Ft8pZ+EDzlYhAnCANXc/QJ7rV+bWe9w4u+7La9hSKwu4lYuO1tLOXTHZW?=
 =?us-ascii?Q?PZXYAqrs5uVVIabbDgSSbL8FtZ09l4rQM6SYwarPN/NtMMTJXxRf27oOVJr9?=
 =?us-ascii?Q?//u8RE8TX5CAd/s6Q4n1V7JEKJQlYn6a1FxW2yzSsIIftJEMgY5xfKRD1VtW?=
 =?us-ascii?Q?kUQLhJcGmtVZMWdqzIv0NQmF9ZovJOIrfMh+0Z/eYUAzFwnluAl7o8w1n3lV?=
 =?us-ascii?Q?9zHUMFC4lMgkvtMYYVVMH3fA5woMB0b0yfC6nH6JCLSUTCWoVZvsCTIDsAZG?=
 =?us-ascii?Q?ymYeb/NfAAO3KaldOdglvNzHKGyCfC1iTeC6YNzWnFRI1cmOFEff1PwQtFvX?=
 =?us-ascii?Q?kkLbB2rwPdULdDYGjNZ78bO7NGtExxcxrDc+YTMsnB9lUnbKTWsZp1LU2szb?=
 =?us-ascii?Q?eqaF+r0+xKkNjrO+0GcurS6XFzifmsIlQrT4sGzZh5kC8CG6ICm1By7q0Efo?=
 =?us-ascii?Q?5fj7rH7ZQKIymHJcgAATRZ9huVef+dhbWaAHixdYycsqwzjnIyUiA8GBpC+O?=
 =?us-ascii?Q?tRMUo5u2vgQ8lFI0cr1OY0D6GDG1aZJFLixN0QSmbFEcdkXJN2Dh+s3Evax6?=
 =?us-ascii?Q?qBQvcq47Wj9zfb/CP6cnrwfVsw/V+KCIpKt4L8UB+KzMVFKzmghA6suT0PBF?=
 =?us-ascii?Q?/LnBWefKU1olxvBtiAd805Dv6McLsaJnmQRO68J72ZWajDXYvnkG7KGEYOSC?=
 =?us-ascii?Q?lRXN0wsn/XnL1Cva/HDTq79DDGbTBG5N7ihlfE4pi0QDYHQIeFHBzA3E4wPj?=
 =?us-ascii?Q?PNwM+k8TZ7cL46kBecjM25PQwk1GN/d97W+1VLX4LckvjPENTYGGsWYVxK0w?=
 =?us-ascii?Q?vWk2ouO2U8n6g87XAXt/RYnyeurTudO5H/NcAL121NFEpDyaECFPRGOx5FRA?=
 =?us-ascii?Q?DzvWN6GavUjKK/NzjW9199Tcpfj/zq4m5oZ5KpGlvnoN5INLeUWnjKiyc4GO?=
 =?us-ascii?Q?tcmEj+I7A4MKivS/ZD8ILN0oYFBi2Ses70hmVyyI28kA2EFKnifiR5pVmIvU?=
 =?us-ascii?Q?POVrcm5K8KRM0JPpfUAIa9SFToRYlEYJ5Ii/F5inCmb3jZHLEiqeVP1dh0hL?=
 =?us-ascii?Q?2yUL6JM9X/Gt6UhP0G3XxI/SjAK5aGL95yLuS/n1qJlg9AhXD984aX+tea0E?=
 =?us-ascii?Q?IsFJHJXkGMElR4u8FJpISWSp9IbKjaAinwRnv/n5cLaCGyWeiXKnHielcSoG?=
 =?us-ascii?Q?sikfNUyChWjTOSRe0sT0TaJOoWGO7HpoioL8N1VIpSKGxqAQqoQAeL5FFK9y?=
 =?us-ascii?Q?qVhxFnoVoKcJxdM1LqS4VQIFQTRITdKMkJKEvJcK29S1nS6XfUVu27ZfR5ah?=
 =?us-ascii?Q?jxEEzCIPuY+Ob0Mj0B4kXV+gGHbixhR/dRxeC69TrWCZHlXGlzyTKrvOduai?=
 =?us-ascii?Q?EmngDC+j1POgf3T+NG/5KgwtflEW+rlsZO9s+tKFbruZT1lG6q3is4E9L9sz?=
 =?us-ascii?Q?juGjtLlnb35pJA7GqQJv5+46g7N94GyW1uHjrq9Wy85rHhyj8s3Zju56z5mA?=
 =?us-ascii?Q?dk18/Cj1HVS+Dfzta5CC1I+3y9ILo22xxNqskLkQgiQNdbGNdKh1CPJySlbB?=
 =?us-ascii?Q?+nteMC5MnJXcWZfpWa6DU7BbEI0=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c50cff2-6f0b-4e41-e3bc-08d9b96aa7fa
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5050.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2021 10:16:38.6724
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ij3zPkUIDFXXQqvjn3+CODRPAAlgRQkdGu4DqB1uiWUxB7/G/Urdf1Uff/7QPjR4THvRqmeU2xGHs3sLjRa/TQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB6810
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

it seems to me that the method of maintaining an example driver
does not work because it will inevitably be

* untested

* out of date

Thus our documentation would be improved by replacing its examples
with code from drivers for real hardware. Such code wouldn't be pretty
or written for text books, but it would be tested.
I could do it this week in a first proposal. But I don't want to start
if somebody feels that the skeleton driver absolutely has to stay.

=C2=A0=C2=A0=C2=A0 Regards

=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 Oliver

