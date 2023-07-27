Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 413397652E1
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jul 2023 13:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbjG0Lsq (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jul 2023 07:48:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233182AbjG0Lsg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jul 2023 07:48:36 -0400
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2057.outbound.protection.outlook.com [40.107.22.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE0D72109
        for <linux-usb@vger.kernel.org>; Thu, 27 Jul 2023 04:48:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X2WbhlTUnyHeEb6zKRj5hhcIVfRtCMm9IhRvabFDfEU9kiuJuocDjV6lG1B36jrqx5GMaG7aSB8zWcq0uH8Vk5uFpJ2Ca3HIm7BEiGzkpy9rYdm2+oRBHECDPGYKtuFrhV28SQoTzImxvRlgwSjuyerfjHZUotjnFhUnU7NC5/2wR1jXaswHMa00VRItJk0kBiG5YNB52n3mju+o94roPOVZV+1AOL+qK+pG/Csa46PyC5tLZ1QfaUDYXMnxG/XqPGHgX/O4+NogGODwwHErjjNyzAfk4s5KHOaZh2Rgyq7FuiG0h/RLBtiNOsAfrja6ybaHG9AWXWOvXpypDKEe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LrfW65hgjB+OIKujKb6DdmeVKWwnfB9MiGh9VttkspQ=;
 b=eY0ElDDOyVYYzY8n5jGalVjPZtpqXXbuUx+c/9LL+eDIUO3BGAs6Nj7Yh4I9NvOs6yo9fsUg5wkv2u3eAjq4xwlnIyXV0ok7ERWyymz/uQDDHSEw2MROVSLsqwHgwV64F6CULSA8kn8jCYqzwCbt7IB4boRLtV64uGOle/ZbHp/FsJVZUyLFUXQ/ePHKkW0cqgVC/VY0tECsn43pZ7MMptCMh4wTyBcSWs8+AlhX43WhTBlSAfkU/olmPn0BTF986G/CC0/M13ma8W04EgGttVXANC20RESuKexOxmfyfjL77vfPcoFVZtqeOFN3lJNJlSaiQJH5u03B+DjnPmFaOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LrfW65hgjB+OIKujKb6DdmeVKWwnfB9MiGh9VttkspQ=;
 b=O4+Os+Q47UdO2Z7VJc+mwXtYpoiwy7ZWWFfp//JqjuQlk3siP4QaJm50f+LSfDbZKkHnmI4F/dvAzjq6ZrLEAMMIFE98TDUlxa9qy8S5P/BNU6OvuyX8ncddOYTOASt1O1pOicZb6T9zkhKK82M8N7AZbR3aBElnm+xDZwdDy9kzxR/sOZnPXpdC3j9IkE8wF0HpGnOvubQRD2dBreCbaeIO7Xmy+77h+qcjHuHJJkwksUSuAtbfQaIYyRbQXE78vIDrEUbqgqkKY5ynKbJQ9RDA3Gs1egt9OMGSrc3F8EoYWtZVMzjiLBBshdti7dzaTLHtWdOSZERz3lldKreddA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com (2603:10a6:800:126::9)
 by DBBPR04MB7980.eurprd04.prod.outlook.com (2603:10a6:10:1f0::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Thu, 27 Jul
 2023 11:48:31 +0000
Received: from VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3]) by VI1PR04MB7104.eurprd04.prod.outlook.com
 ([fe80::7ef4:97ef:66d5:f5b3%2]) with mapi id 15.20.6631.026; Thu, 27 Jul 2023
 11:48:31 +0000
Message-ID: <6dcde4c2-9400-44af-c8b4-5e63b947a2bf@suse.com>
Date:   Thu, 27 Jul 2023 13:48:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-US
To:     marco@zatta.me,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
From:   Oliver Neukum <oneukum@suse.com>
Subject: Something is really broken for Logitech webcams
Cc:     USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR2P281CA0044.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::18) To VI1PR04MB7104.eurprd04.prod.outlook.com
 (2603:10a6:800:126::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB7104:EE_|DBBPR04MB7980:EE_
X-MS-Office365-Filtering-Correlation-Id: a1f833b1-5cc1-4b48-4ad1-08db8e976672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ELMl/XOTzeL5EI8YHPJ2rLIksQBzGRZJOYoBD6SDHG1Ow5OIIk5DgCf59EGY2rxFPxJ3rxB5GC3EOffQat4jpkYjYnYv9o5Bizb6R7WOyP2Oh3/rjS0MWVBQw+uO9G2zAaZAPRdfPObDwjjB4GV6W8MG0Vhwwewhi7fReelMzaGUuNYFs5llhvTfpHKOi7WkqpMGUA1vUkUMGPRIL2DpR+UDro9YK+a7RDpIks84rtigyCBahqO8dF/iy1HRKjik+5Z+NlayuQOa5YLtfzDQlFptJWNS6V+p9FrGJ91rL0gUEzsO8zgLbug9JPNVZxinfEZy88hXVYmWOOxhN/FeFAwibu/KQJFgzFXYDFJFVT/Pg2Sg3x9y5TQY34k08d+iHWJw62t5W6FFOMGTwakxQ2wLH+echvanvy137NvG71rNnnscoNOuw6zC2le1Qi9o9IrH8V9rRJD9mhIaywNOtShNoUhCgQFRxwAofZCgCSfz2/056WqJblNr242sju5TH95w/aJGk8np2JmDYlWAn0AYYmmqWQMClPAWFtHM8pEtRdJBqwEW2GUWbJmUmYb2M66Mr6txf5dUwUAw/Vu+H/1hzvm+moBkvqKuyUu33KTmC2vkCumK6DgTRk7EozN3mDXKJv/lcWzJccOYLp7chQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB7104.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(136003)(376002)(396003)(39860400002)(451199021)(31686004)(478600001)(186003)(6486002)(6666004)(5660300002)(8936002)(6506007)(6512007)(36756003)(2906002)(66574015)(66476007)(38100700002)(41300700001)(8676002)(31696002)(4326008)(2616005)(66556008)(316002)(86362001)(6916009)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFdUbFRpb1BJd0JtcXl3NmtiNjRHR3ZCdWtCTmdlTkJ1L29ka3ZNRDZ3T0ZL?=
 =?utf-8?B?d1FHZUN3bkQvVHlrNHE0TXRvdVVnSlV2VElTYi9lT00waXFBNWJKWXNFd0ZC?=
 =?utf-8?B?YkN5MUlLVXVVdWlQSHVlZFQ0WnpUYWlXTzlqblFmUDVhcXEwNHdYTTZIU1dZ?=
 =?utf-8?B?eXRxRncveVEwak9DNFpVUmlVM0JFZTcxbUJLNnBhcUpES3dNTVlrQndlOUdQ?=
 =?utf-8?B?YlUvTWhLNjhkS2RDdkY2S0g4VjR5QXRwWURsYzN5OU5tS3p3NHZaNUxCSDUw?=
 =?utf-8?B?amI1RWRnOVQ0aXoya1U1V0syWjlUMEo4Y2xZaFBBNSt5UDkvU09rNzRRTG1p?=
 =?utf-8?B?c28zbXVhRDQ3a0FwSTlqWlpZN1NTSDM4cEdUUzVydzZJZWh1a2t5bS83V3F2?=
 =?utf-8?B?WldxMVVzOGMxVzJqQzBEZ041OTJLUXRveDAwLzc5bVdJbmh3SkFoeVhoMXcw?=
 =?utf-8?B?Mk93enp6NTZvVGFLS1EzalFzbWh0dWEvdjhwU1dyWkNzdmw4U0pMamt3Si8r?=
 =?utf-8?B?ZjFFWG8xMFM2SWMzaE1XRWpvUUp2YmIvKzU3T0hieHNFTFVHSFRFbzFUNEc0?=
 =?utf-8?B?bjBYK1Btd1c2SThxS1lXbWM0anhRZjVpYUNwVGVzY2NnNVJmbmNMMmJFVTUy?=
 =?utf-8?B?dEZCS0dOOTNVSDNVTForT2tYa01wd0VFVmRpR3VlMUR2ZFo4S21qdFMraFlR?=
 =?utf-8?B?akNXUzBpTk1VaUFYWDZjMzRDUk5XOW5WVnc0ZHIxL2xUWkdUUnNwVTBSMzFU?=
 =?utf-8?B?VWRpNk8xZS9zdkNQNUhXWmtzQTYxUnk0MDh5WjBrUmRhN2xqbm9PRDUyR3N1?=
 =?utf-8?B?dkhIK2ZmeCtERDVaeGNGaVEwSjg5TjVXV1VXMjEySnFhdWhGNUY3ZFZzQUZ6?=
 =?utf-8?B?VXFFNVdSSTJrbFJEVkNNSDljUVB3WG9ub0piVlJpMk9MRnVzenFZZWhDaGRi?=
 =?utf-8?B?NnBsQ0daTEpOTzlCa2Z5cUhkWXA5TWZjUER1blJzMm4yNzJqYUxLYjA5WS91?=
 =?utf-8?B?ZVBSUTdlQzIzNlptVjRJQXBOVEJGZFhTRkFLWXgwR04xMFlHRGtCb2s3bVVS?=
 =?utf-8?B?V0xJM1d6TWc1NE9LOTZxTEErYzZDMWJ3NVdwQTIyY016UnBFb2FUY2xrNUZX?=
 =?utf-8?B?QVlQYkJLMkpkWXFRTUI3eWRBMVdXUXF5NGNWZ0xMdTFwOHRyZWI0aVZDN28w?=
 =?utf-8?B?WWxEWjdQYlFLNStjazhOWjZPVlBTck95SGVDM2dTRTV4ZkZZV2RFeEF6YXcw?=
 =?utf-8?B?R0NNd1R5RE1NUDV2eDdmYkIvMmtleTFyc1cxRGp4RzErekxMd2EvU0VBRnJS?=
 =?utf-8?B?V3ZCd01pL1JoaEJhaUpSYjc3ck5qYVhnek94YjBCT3FDNTUrcU5EdmpHU0JX?=
 =?utf-8?B?MWNCdno1M1I0RkxBUmVXVHdMd0U0VGVPUzJUbUxHbkg2VnYvejM4Zlp0SUxF?=
 =?utf-8?B?MUc0UXFzaWpTeS9EQUpMNUJXNzFFbGxhQmZUOXM0UHFKMmRiOXNzSURMV09l?=
 =?utf-8?B?RDkvbVNmdXR0RlFKU213TzZzbHlmNkNHVEV5dE5lQkl4WGpEdDNpQ1pMVUxz?=
 =?utf-8?B?THVKUGp5ZjJOUlE5TmdZNEZsNlAyMVY0a1lmRk0rejM2VXI2ZjRheW9aYzZF?=
 =?utf-8?B?OXpUZ1VmdEhLb0N3ZGExUzN4M1JNSzhWT2dKWk1BNTZKOTlWYU1tRDRncUdI?=
 =?utf-8?B?c0N5L1ZPNVBra2RzVUdmbnA5QUFuNWY2Zjh4WVNLOTZ6bU5YZDJhbk0yakZ3?=
 =?utf-8?B?RGx2bm9LYnFCM2ptVGlVRjhKcU1JemtTT3k4UkpWZ0JXaVQ2bEljY2E3Zkt4?=
 =?utf-8?B?VXFIUFdGbndXazV5L0M1ZGUxM1Y4T2JGWjdRMHBYSmVCeHVuTHRDc1B6MXhB?=
 =?utf-8?B?M2NiNlRIY1QzZVVXOHdZSFNyYlMrYWI2c1o5cVpTYzg5b2hkRkd5MUI3OHEr?=
 =?utf-8?B?Rm44RlIvaVNpQTl0TjBuUXl0dWFvaThXbEtCNTR3K2ZXMEIvVGpXbmpuNGlL?=
 =?utf-8?B?NFViWGhOMHdMd2VxMlpOaVpXY25hckVFNmZNbFN3SlVEOUdnckpGR0gvSzZD?=
 =?utf-8?B?YTVETkM3WUZsTk5mUTlwdmlOM3hxd2p1c3hqYWpRbEZCM0xKbm9MUkg2dWlu?=
 =?utf-8?B?cVUzZlF5WFZpMlRVQ1Y2QVVIYjdmdTV6U0psU0MvcEtkODlyRm0vc2grcTNO?=
 =?utf-8?Q?qj2+nHKAHhCDV1gH2ieOHXw=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1f833b1-5cc1-4b48-4ad1-08db8e976672
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB7104.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2023 11:48:31.4614
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k3X29//9kXQN/yhK5/57epBzG7eTUJ4BbeQtX6RqhLz9/8br0LwhTITAGEc9B3I8ynLpY5LwvhqD7MvLlWnwRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7980
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

looking at bd21f0222adab
("USB: Fix chipmunk-like voice when using Logitech C270 for recording audio.")
we see that it introduced RESET_RESUME for the C270 webcam

For that camera I asked a user to provide lsusb, which got this
(a bit shortened)

Bus 001 Device 004: ID 046d:0825 Logitech, Inc. Webcam C270
Device Descriptor:
   bLength                18
   bDescriptorType         1
   bcdUSB               2.00
   bDeviceClass          239 Miscellaneous Device
   bDeviceSubClass         2
   bDeviceProtocol         1 Interface Association
   bMaxPacketSize0        64
   idVendor           0x046d Logitech, Inc.
   idProduct          0x0825 Webcam C270

     Interface Descriptor:
       bLength                 9
       bDescriptorType         4
       bInterfaceNumber        0
       bAlternateSetting       0
       bNumEndpoints           1
       bInterfaceClass        14 Video
       bInterfaceSubClass      1 Video Control
       bInterfaceProtocol      0
       iInterface              0

So this thing says that it is UVC. That means that it should trigger
e387ef5c47dde ("usb: Add USB_QUIRK_RESET_RESUME for all Logitech UVC webcams")
adding the following declaration:

static const struct usb_device_id usb_interface_quirk_list[] = {
         /* Logitech UVC Cameras */
         { USB_VENDOR_AND_INTERFACE_INFO(0x046d, USB_CLASS_VIDEO, 1, 0),
           .driver_info = USB_QUIRK_RESET_RESUME },

wich AFAICT matches the device.

On the face of it, this makes no sense. What is going on here?
Do we really need to assume that Logitech has been selling a whole slew
of cameras in both UVC and something else, which we have no driver for,
but nobody complains?

Could somebody please look at this or am I somehow not right in the head?

And Marco specifically, did you make your patch based on a bisection?

	Regards
		Oliver


