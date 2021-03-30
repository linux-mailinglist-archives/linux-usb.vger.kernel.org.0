Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AD3E34E791
	for <lists+linux-usb@lfdr.de>; Tue, 30 Mar 2021 14:37:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231992AbhC3MhM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Mar 2021 08:37:12 -0400
Received: from mail-eopbgr1300105.outbound.protection.outlook.com ([40.107.130.105]:44416
        "EHLO APC01-HK2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231434AbhC3Mgt (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Mar 2021 08:36:49 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFIj2iIPB+gFHTvVJlaqWjyQ38dbU7cZZgChjLa+sdxS5Zsa6+7CpF4SuwUucXe7uQ2g28K2IpyPqHEORziXu45Tht7otgHuC6A4DrIz+x4PR7cZLCUfEhP5Z7yAt1J+pkZgA0MuRNwk+NfuCXd73sAf6VOhXj+FMFWyKRnbGWJsu+FWIOB3zcxRpFxmQnX8de62rEgbxKFBOf+MGJbn4TkfnWMEorQwJjw9o0cnaoqkgTQjZ8kH6zFCeIz7+TKmP9q1k67ZENWUvwCkyqbhRAtBizpgFfiryF2qk8WSF9Q1Y2K5tH2RfFFahYfL4cwb+hCAVS7E8+tkslfymhsn0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksFVN2LMF3bYCA2VNKcsdF0rwy+yMcp0jHFxC2IQFCA=;
 b=HTeTgssQxzERkxAjYiIMqFrLYz4ImJdOo0lwHYXk+d+kxgY1HmhXkgWzcp8CqZJmViIF8UM/0cEEYfyN5nK9OQQ/2GEVVdDqat7k+kbDImPXKqGLNFX5zQGppAk7G3LDd1oe3I+otiEIXjxq4i+yFJ44lb2leEyxQKHXcVSGJj4DzU8us0Wbrx2b84RP3UcArBq3EpukB+V2XfSP44l3AOAhPrbv2qoaqn/z3SiH1NYaapPmc/bLcV+LE5sS3t+t4Sw+wQDhBfeVpkxiYYbccHIRfq92lT4O1ZEkKN8qJ6Y1PWGPqJzkusfDh5uWN8KH2jCrhfjuZJsGj9kdX8PZjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zenithal.me;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ksFVN2LMF3bYCA2VNKcsdF0rwy+yMcp0jHFxC2IQFCA=;
 b=SeidR6RI34ge8y8IJ7UZ4wA8oPyaGOpO36gvLpUJCqGkOuAwjsNQ5lQDBEvBw/siFCVoyn31coxYYiqIqw6WhStCvmrzr9VtkZejJ8RI10dIxQZq6badTgDW3/F+DDI0UKXmkYYd79a4CRXTULhs/5SWAy1KA+YdupPYDsTMIz8=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=zenithal.me;
Received: from HK0PR03MB3795.apcprd03.prod.outlook.com (2603:1096:203:3c::10)
 by HK2PR0302MB2451.apcprd03.prod.outlook.com (2603:1096:202:a::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.19; Tue, 30 Mar
 2021 12:35:55 +0000
Received: from HK0PR03MB3795.apcprd03.prod.outlook.com
 ([fe80::8492:e28e:e777:6d05]) by HK0PR03MB3795.apcprd03.prod.outlook.com
 ([fe80::8492:e28e:e777:6d05%6]) with mapi id 15.20.3977.025; Tue, 30 Mar 2021
 12:35:55 +0000
Date:   Tue, 30 Mar 2021 20:35:37 +0800
From:   "Hongren Zheng (Zenithal)" <i@zenithal.me>
To:     Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?iso-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Alexandre Demers <alexandre.f.demers@gmail.com>,
        linux-usb@vger.kernel.org, usbip-devel@lists.sourceforge.net,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: Re: [PATCH v5] docs: usbip: Fix major fields and descriptions in
 protocol
Message-ID: <YGMbGdJM5iTqHXi1@Sun>
References: <YFAXGBSxaZJ8Dy3/@Sun>
 <51edf4bb-1b00-a3b8-4277-25c282588858@linuxfoundation.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51edf4bb-1b00-a3b8-4277-25c282588858@linuxfoundation.org>
X-Operating-System: Linux Sun 5.10.19-1-lts
X-Mailer: Mutt 2.0.6 (98f8cb83) (2021-03-06)
X-Originating-IP: [2402:f000:6:6009::11]
X-ClientProxiedBy: BY3PR05CA0008.namprd05.prod.outlook.com
 (2603:10b6:a03:254::13) To HK0PR03MB3795.apcprd03.prod.outlook.com
 (2603:1096:203:3c::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2402:f000:6:6009::11) by BY3PR05CA0008.namprd05.prod.outlook.com (2603:10b6:a03:254::13) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.15 via Frontend Transport; Tue, 30 Mar 2021 12:35:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 86d7c44e-7456-4349-a177-08d8f3785ba9
X-MS-TrafficTypeDiagnostic: HK2PR0302MB2451:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK2PR0302MB245154519222424602BEFD8EBC7D9@HK2PR0302MB2451.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Nezpmgyk601ZtV5LzUEDxsUWJx7Mcg44F0YLdiZK+EObOCvqZOXNTKKj2tvdKKJNKlfqYy67j74gJ8PBCZg8Mwa9uB/pOsZ0AQde68axgMdVDTFtoTuAQ8m2dimPGhZw8V/qFFv9e+ajvdBy/879ftXkSxlFSD5NAe+IWdkQCdSQUQuxnOl+OnOUlTk2GoJFx/pCqxTrxIOmH4mVhrFaVqFnYKFIXB0UwMyjRTxJU74jTEmxpyjMCu5TUahg24J585jJku/2G1OEM01qZtySz/XSQkpU8RqrVMZvGNM9SCWXMpfbyVnbeEi4J5b3A5mnlHQjAh88pViVT9ktULvY68pHmo5b/fRURmlvzZQN/2PdLhi0k2oZKxGEsIbMZeLRtHVbYvNhiUMPtx3e0mbCjvatp6QD4u6qwj3k130G2zMz9n89RW9QxwguCRyo9JVcQQXR2s0tnyWSSAYfxil4OsJor89Bqj9XGn1Vt0TlpdODZeL0AXxRzPEOP+GGYKWR/3rumehPg9U+tbhAhuiDPe3Ob7vF9jGTMVZofEvZwjOqmNnrcBndDHo7vZNXLvKSKJv8VysPuB33Yz44YfqjoJAmN2wKz2J3xRnCjSCiZc2UkhgNjL72K16EEIr8hJ7ktm0XBB4pg1pcLIhZllB1vy1j8sRjSPxjNza0W58f3S7SPWXNBY4qJRv3yKLefkttYkEPgoCnPNvHdDfnDVQIcBtuTjmbDHsFLaGeL4R0OsrGb/Im15g3We/ybdAVB4b
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR03MB3795.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(136003)(346002)(39830400003)(396003)(366004)(376002)(478600001)(52116002)(38100700001)(6486002)(6496006)(16526019)(966005)(86362001)(7416002)(786003)(316002)(2906002)(33716001)(66946007)(54906003)(53546011)(110136005)(66476007)(83380400001)(30864003)(8936002)(5660300002)(8676002)(66556008)(9686003)(4326008)(186003)(6666004)(49092004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?dyQ6LUB2UgKhWGeVCG+/lcehomKNQLJnpRWhECA1IDfgtYCTrWszdYsL8CDp?=
 =?us-ascii?Q?ldsWLXfg4rKFu7RkKzeKttLJ5LoFBSMKpOepQ0iN6R2Xzl/YoBOi+LGe+jEM?=
 =?us-ascii?Q?H9y9FKJHeoU5125o+tD0zDUgzg02MkRniOPTmwbZQzOvQy2QnI6T9DVf6BTQ?=
 =?us-ascii?Q?qaLbP9yIwe0dTPYMrPDKIwU5g2eFNFLqjP26O/oU/dIA7Q1VsOwTG+tBWIB5?=
 =?us-ascii?Q?0NRfB1kRqJit+ulVZny49Ww6NnccjSLIXMzJElaOCZE0PrPMg2IoZjhJ2E2h?=
 =?us-ascii?Q?eeFvXcUTzt+vr1WVGU8y0Y/vfmcbrIGpb+dfa6clO3Z+iOLYNxupPkwBEpXi?=
 =?us-ascii?Q?767VXHM55RGOZ/GUt9ghd8vzGMZu0OO0YxjFO9iSiASUpDAHx2nYIBGeWMB1?=
 =?us-ascii?Q?KgI7OQW6FTkvamTJnVFjtdMp16yCG3DVhydy5lKQ27hj8MdrlV2vanvmXPpJ?=
 =?us-ascii?Q?Ex10U7zF4h5OvT9vFBUESbzh3r/71gdaQLV4mfitBSSOWa7QzwZcsRIDHunT?=
 =?us-ascii?Q?SsruirRKKIHB+ERcu6vxAG+mG7ERD5v7jrg/5fZjXfiNyAaoiyB5RQXwZsdY?=
 =?us-ascii?Q?Ehno61vhW7OI5u2C/76ocoOcBXNZjptcCNfo6vcAITyCAAYjqbWGWuieuRyg?=
 =?us-ascii?Q?6Qnjnikm1KtreTuOEuODAtnRKPfLh3sBcnr4IFRGbHlMkAMrJgv6YryhYCS5?=
 =?us-ascii?Q?GMOtr7XWMmMF1F5cYGebUYq9vTLYg6MJHdHxL6YKZ4MU4iw2qsuho5uEP9kW?=
 =?us-ascii?Q?zMUKoSENiQo1astzcjkuz27HMcjm6a63052H9AjhvpGQ9mlK2Oavhc6s9rDA?=
 =?us-ascii?Q?kOszPnaiNDLy4haLnbN8XHCCWwFwYXl2zWF6EPv/T/8yYPIRFAhle2Sv5WnS?=
 =?us-ascii?Q?1/LuaBNNu07Zwq5bhM0aRnAWwDyJvRJGfjhuSDcKnnWd6zItcDujryVesleV?=
 =?us-ascii?Q?Oqyt5KJSqW55OAVeXqpC57Ox2mt58ZiFs/Ko62na7D8ZJ3y1CcdTwQ+P+0XV?=
 =?us-ascii?Q?UcBJy+34m6E8ljHH5WqF7BIaSoyid+doBy6/dSG44K75NbjJuEDsntc17y39?=
 =?us-ascii?Q?Ik7AlrBgL0cUy57rfjNPK5LdyyqpKtSBViAL8h194loN3Is58ndAyXkjpTrW?=
 =?us-ascii?Q?X25EGBxabBxVTSL6sacxEX9562RxDZdMnTxOW1kr7LHVUKDwoDT5MW6zPISb?=
 =?us-ascii?Q?RAzrAUSn8caw/Cac86+zy5kNFdTQvf1wuYqJPukPR+xIT2l9ZdCTeBJKhKKD?=
 =?us-ascii?Q?IYsFpiNDUWpnLU2SDcIU/RZmY2tSxpVhWAaqdOmKv3n15hOSNgdvTUfZRDQ1?=
 =?us-ascii?Q?JwPBIxrILGslLiQpNv2L39mUcLkjggJ+kXdGnFd7pjv/Yg=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: 86d7c44e-7456-4349-a177-08d8f3785ba9
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3795.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2021 12:35:55.0313
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3a/jgz7L6xchSG6N8fDNiLN6SUEwqsc1MUomqj4hmEeoPvS+DWjvJW9vUC5zti1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0302MB2451
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 29, 2021 at 02:06:56PM -0600, Shuah Khan wrote:
> On 3/15/21 8:25 PM, Hongren Zheng (Zenithal) wrote:
> > The old document for usbip protocol is misleading and hard to read:
> >    * Some fields in header are incorrect
> >    * Explanation of some fields are unclear or even wrong
> >    * Padding of header (namely all headers have the same length) is
> >      not explicitly pointed out, which is crucial for stream protocol
> >      like TCP
> > 
> > Major changes:
> >    * Document the correct field as described in the codebase.
> >    * Document the padding in usbip headers. This is crucial for TCP
> >      stream hence these padding should be explicitly point out.
> >      In code these padding are implemented by a union of all headers.
> >    * Fix two FIXME related to usbip unlink and Document the behavior
> >      of unlink in different situation.
> >    * Clarify some field with more accurate explanation, like those
> >      fields associated with URB. Some constraints are extracted from
> >      code.
> >    * Delete specific transfer_flag doc in usbip as it should be
> >      documented by the URB part.
> 
> Why are we deleting this. What do you mean documented by URB part?

transfer_flag are actually defined by the URB struct,
refer to https://www.kernel.org/doc/html/latest/driver-api/usb/URB.html
and usbip headers just encapsulate this flag.
You may refer to usbip_pack_cmd_submit in
/drivers/usb/usbip/usbip_common.c and notice that 
the flag are just copied from one URB with a small tweak.
(Note that this tweak is also documented below).

Hence the possible transfer flags for each transfer type
should be explained by URB document, not USB/IP document.
I think documenting them here is duplicated, hence I deleted
them.

> 
> >    * Add data captured from wire as example
> > 
> > Co-developed-by: Alexandre Demers <alexandre.f.demers@gmail.com>
> > Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
> > Signed-off-by: Hongren Zheng <i@zenithal.me>
> > ---
> >   Documentation/usb/usbip_protocol.rst | 320 ++++++++++++++-------------
> >   1 file changed, 171 insertions(+), 149 deletions(-)
> > 
> > PATCH v2:
> > Some changes suggested by a previous patch in
> > https://lore.kernel.org/linux-usb
> > /20180128071514.9107-1-alexandre.f.demers@gmail.com/
> > is adopted in this patch.
> >    * Fix Typo: duplicated 'the' in 'the following 4 field'
> >    * Fix incorrect field: in OP_REQ_DEVLIST, the second dev starts with
> >      field 'path', not 'busid'
> > 
> > PATCH v3:
> > Suggested by
> > https://lore.kernel.org/linux-doc/YE8Oan2BmSuKR4%2Fp@kroah.com/
> >    * Remove date and changelog in doc as these are tracked in git history
> >    * Remove 'mistake alert' as all data fields are documented properly
> >      now. However, docs on possible values for some field shall be added
> >      in the future
> > 
> > PATCH v4:
> > Suggested by https://lore.kernel.org/linux-doc
> > /40351ed6-2907-3966-e69a-a564173b3682@infradead.org/
> >    * Add punctuations for readability
> >    * Move patch changelog after the marker line
> >    * Remove nickname in signed-off-by line
> > 
> > PATCH v5:
> >    * Instead of co-developed-by, use reviewed-by
> >      for Randy Dunlap
> > 
> > diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
> > index 988c832166cd..54c5677adf4e 100644
> > --- a/Documentation/usb/usbip_protocol.rst
> > +++ b/Documentation/usb/usbip_protocol.rst
> > @@ -2,11 +2,11 @@
> >   USB/IP protocol
> >   ===============
> >    > -PRELIMINARY DRAFT, MAY CONTAIN MISTAKES> -28 Jun 2011
> > +Architecture
> 
> Let's add doc version preserving the history.
> Add Version 1 and date perhaps.

GKH suggested tracking version by git changlog, so I deleted
these fields. Refer to
https://lore.kernel.org/linux-doc/YE8Oan2BmSuKR4%2Fp@kroah.com/

> 
> > +============
> >   The USB/IP protocol follows a server/client architecture. The server exports the
> > -USB devices and the clients imports them. The device driver for the exported
> > +USB devices and the client imports them. The device driver for the exported
> 
> clients import them.

Will be adopted in the next version of the PATCH

> 
> >   USB device runs on the client machine.
> >   The client may ask for the list of the exported USB devices. To get the list the
> > @@ -37,6 +37,9 @@ to transfer the URB traffic between the client and the server. The client may
> >   send two types of packets: the USBIP_CMD_SUBMIT to submit an URB, and
> >   USBIP_CMD_UNLINK to unlink a previously submitted URB. The answers of the
> >   server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
> > +Note that after successful USBIP_RET_UNLINK, the unlinked URB request would not
> > +have a corresponding USBIP_RET_UNLINK (this is explained in
> > +drivers/usb/usbip/stub_rx.c).
> 
> This is not clear to me. Doesn't look correct. Where do you see this
> in drivers/usb/usbip/stub_rx.c?

Sorry that this is a typo. I meant "the unlinked URB request would not
have a corresponding USBIP_RET_SUBMIT".
This is shown in the following flow by the "<-X--X--" line.
This will be fixed in the next version of this PATCH.

The explanation is in the comments of function stub_recv_cmd_unlink.
"The unlinking flag means that we are now **not** going to return the normal
result pdu of a submission request, **but** going to return a result pdu of
the unlink request"
This behavior is implemented by **replacing** the normal result pdu
with a unlink result pdu. You may walk through this function to 
understand the behavior.
So should I add this function name in the document for clarity?

> 
> >   ::
> > @@ -85,16 +88,42 @@ server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
> >             |                        .                        |
> >             |                        :                        |
> >             |                                                 |
> > +          |            USBIP_CMD_SUBMIT(seqnum = p)         |
> > +          | ----------------------------------------------> |
> > +          |                                                 |
> > +          |               USBIP_CMD_UNLINK                  |
> > +          |         (seqnum = p+1, unlink_seqnum = p)       |
> > +          | ----------------------------------------------> |
> > +          |                                                 |
> > +          |               USBIP_RET_UNLINK                  |
> > +          |        (seqnum = p+1, status = -ECONNRESET)     |
> > +          | <---------------------------------------------- |
> > +          |                                                 |
> > +          |         Note: No USBIP_RET_SUBMIT(seqnum = p)   |
> > +          | <--X---X---X---X---X---X---X---X---X---X---X--- |
> > +          |                        .                        |
> > +          |                        :                        |
> > +          |                                                 |
> > +          |            USBIP_CMD_SUBMIT(seqnum = q)         |
> > +          | ----------------------------------------------> |
> > +          |                                                 |
> > +          |            USBIP_RET_SUBMIT(seqnum = q)         |
> > +          | <---------------------------------------------- |
> > +          |                                                 |
> >             |               USBIP_CMD_UNLINK                  |
> > +          |         (seqnum = q+1, unlink_seqnum = q)       |
> >             | ----------------------------------------------> |
> >             |                                                 |
> >             |               USBIP_RET_UNLINK                  |
> > +          |           (seqnum = q+1, status = 0)            |
> >             | <---------------------------------------------- |
> >             |                                                 |
> 
> I would do this differently. Let's add this as an expanded
> USBIP_CMD_UNLINK sequence with a separate heading below the
> current flow

Currently we have two flows, one for device list and another for
device import and URB transfer.
I think that UNLINK is a common command within the latter flow,
namely SUBMIT and UNLINK are interweaved in the whole flow,
and separating UNLINK from SUBMIT would cause logical separation
as if they follows different flow.

I think what I have documented is the full use case for UNLINK,
so I wonder what do you mean by "expanded sequence".

> 
> >   The fields are in network (big endian) byte order meaning that the most significant
> >   byte (MSB) is stored at the lowest address.
> > +Message Format
> > +==============
> >   OP_REQ_DEVLIST:
> >   	Retrieve the list of exported USB devices.
> > @@ -102,7 +131,7 @@ OP_REQ_DEVLIST:
> >   +-----------+--------+------------+---------------------------------------------------+
> >   | Offset    | Length | Value      | Description                                       |
> >   +===========+========+============+===================================================+
> > -| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0 |
> > +| 0         | 2      | 0x0111     | Binary-coded decimal USBIP version number: v1.1.1 |
> >   +-----------+--------+------------+---------------------------------------------------+
> 
> Let's make this vx.x.x and specify current version number at the top.
> Saves us doc updates as we change version number - one location change
> as opposed to the entire document

Will be adopted in the next version of the PATCH.

A sidenote though, the version number has not changed since the 
release (out of staging) of usbip.

> >   | 2         | 2      | 0x8005     | Command code: Retrieve the list of exported USB   |
> >   |           |        |            | devices.                                          |
> > @@ -116,7 +145,7 @@ OP_REP_DEVLIST:
> >   +-----------+--------+------------+---------------------------------------------------+
> >   | Offset    | Length | Value      | Description                                       |
> >   +===========+========+============+===================================================+
> > -| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0.|
> > +| 0         | 2      | 0x0111     | Binary-coded decimal USBIP version number: v1.1.1 |
> >   +-----------+--------+------------+---------------------------------------------------+
> >   | 2         | 2      | 0x0005     | Reply code: The list of exported USB devices.     |
> >   +-----------+--------+------------+---------------------------------------------------+
> > @@ -165,8 +194,8 @@ OP_REP_DEVLIST:
> >   | 0x143     | 1      |            | bNumInterfaces                                    |
> >   +-----------+--------+------------+---------------------------------------------------+
> >   | 0x144     |        | m_0        | From now on each interface is described, all      |
> > -|           |        |            | together bNumInterfaces times, with the           |
> > -|           |        |            | the following 4 fields:                           |
> > +|           |        |            | together bNumInterfaces times, with the following |
> > +|           |        |            | 4 fields:                                         |
> >   +-----------+--------+------------+---------------------------------------------------+
> >   |           | 1      |            | bInterfaceClass                                   |
> >   +-----------+--------+------------+---------------------------------------------------+
> > @@ -177,7 +206,7 @@ OP_REP_DEVLIST:
> >   | 0x147     | 1      |            | padding byte for alignment, shall be set to zero  |
> >   +-----------+--------+------------+---------------------------------------------------+
> >   | 0xC +     |        |            | The second exported USB device starts at i=1      |
> > -| i*0x138 + |        |            | with the busid field.                             |
> > +| i*0x138 + |        |            | with the path field.                              |
> >   | m_(i-1)*4 |        |            |                                                   |
> >   +-----------+--------+------------+---------------------------------------------------+
> > @@ -187,7 +216,7 @@ OP_REQ_IMPORT:
> >   +-----------+--------+------------+---------------------------------------------------+
> >   | Offset    | Length | Value      | Description                                       |
> >   +===========+========+============+===================================================+
> > -| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0 |
> > +| 0         | 2      | 0x0111     | Binary-coded decimal USBIP version number: v1.1.1 |
> >   +-----------+--------+------------+---------------------------------------------------+
> >   | 2         | 2      | 0x8003     | Command code: import a remote USB device.         |
> >   +-----------+--------+------------+---------------------------------------------------+
> > @@ -206,7 +235,7 @@ OP_REP_IMPORT:
> >   +-----------+--------+------------+---------------------------------------------------+
> >   | Offset    | Length | Value      | Description                                       |
> >   +===========+========+============+===================================================+
> > -| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0 |
> > +| 0         | 2      | 0x0111     | Binary-coded decimal USBIP version number: v1.1.1 |
> >   +-----------+--------+------------+---------------------------------------------------+
> >   | 2         | 2      | 0x0003     | Reply code: Reply to import.                      |
> >   +-----------+--------+------------+---------------------------------------------------+
> > @@ -254,158 +283,151 @@ OP_REP_IMPORT:
> >   | 0x13E     | 1      |            | bNumInterfaces                                    |
> >   +-----------+--------+------------+---------------------------------------------------+
> > -USBIP_CMD_SUBMIT:
> > -	Submit an URB
> > +The following four commands have a common basic header called
> > +'usbip_header_basic', and their headers, called 'usbip_header' (before URB
> > +payload), have the same length, therefore paddings are needed.
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| Offset    | Length | Value      | Description                                       |
> > -+===========+========+============+===================================================+
> > -| 0         | 4      | 0x00000001 | command: Submit an URB                            |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 4         | 4      |            | seqnum: the sequence number of the URB to submit  |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 8         | 4      |            | devid                                             |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0xC       | 4      |            | direction:                                        |
> > -|           |        |            |                                                   |
> > -|           |        |            |    - 0: USBIP_DIR_OUT                             |
> > -|           |        |            |    - 1: USBIP_DIR_IN                              |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x10      | 4      |            | ep: endpoint number, possible values are: 0...15  |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x14      | 4      |            | transfer_flags: possible values depend on the     |
> > -|           |        |            | URB transfer type, see below                      |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x18      | 4      |            | transfer_buffer_length                            |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x1C      | 4      |            | start_frame: specify the selected frame to        |
> > -|           |        |            | transmit an ISO frame, ignored if URB_ISO_ASAP    |
> > -|           |        |            | is specified at transfer_flags                    |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x20      | 4      |            | number_of_packets: number of ISO packets          |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x24      | 4      |            | interval: maximum time for the request on the     |
> > -|           |        |            | server-side host controller                       |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x28      | 8      |            | setup: data bytes for USB setup, filled with      |
> > -|           |        |            | zeros if not used                                 |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x30      |        |            | URB data. For ISO transfers the padding between   |
> > -|           |        |            | each ISO packets is not transmitted.              |
> > -+-----------+--------+------------+---------------------------------------------------+
> > +usbip_header_basic:
> > ++-----------+--------+---------------------------------------------------+
> > +| Offset    | Length | Description                                       |
> > ++===========+========+===================================================+
> > +| 0         | 4      | command                                           |
> > ++-----------+--------+---------------------------------------------------+
> > +| 4         | 4      | seqnum: sequential number that identifies requests|
> > +|           |        | and corresponding responses;                      |
> > +|           |        | incremented per connection                        |
> > ++-----------+--------+---------------------------------------------------+
> > +| 8         | 4      | devid: specifies a remote USB device uniquely     |
> > +|           |        | instead of busnum and devnum;                     |
> > +|           |        | for client (request), this value is               |
> > +|           |        | ((busnum << 16) | devnum);                        |
> > +|           |        | for server (response), this shall be set to 0     |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0xC       | 4      | direction:                                        |
> > +|           |        |                                                   |
> > +|           |        |    - 0: USBIP_DIR_OUT                             |
> > +|           |        |    - 1: USBIP_DIR_IN                              |
> > +|           |        |                                                   |
> > +|           |        | only used by client, for server this shall be 0   |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x10      | 4      | ep: endpoint number                               |
> > +|           |        | only used by client, for server this shall be 0;  |
> > +|           |        | for UNLINK, this shall be 0                       |
> > ++-----------+--------+---------------------------------------------------+
> > - +-------------------------+------------+---------+-----------+----------+-------------+
> > - | Allowed transfer_flags  | value      | control | interrupt | bulk     | isochronous |
> > - +=========================+============+=========+===========+==========+=============+
> > - | URB_SHORT_NOT_OK        | 0x00000001 | only in | only in   | only in  | no          |
> > - +-------------------------+------------+---------+-----------+----------+-------------+
> > - | URB_ISO_ASAP            | 0x00000002 | no      | no        | no       | yes         |
> > - +-------------------------+------------+---------+-----------+----------+-------------+
> > - | URB_NO_TRANSFER_DMA_MAP | 0x00000004 | yes     | yes       | yes      | yes         |
> > - +-------------------------+------------+---------+-----------+----------+-------------+
> > - | URB_ZERO_PACKET         | 0x00000040 | no      | no        | only out | no          |
> > - +-------------------------+------------+---------+-----------+----------+-------------+
> > - | URB_NO_INTERRUPT        | 0x00000080 | yes     | yes       | yes      | yes         |
> > - +-------------------------+------------+---------+-----------+----------+-------------+
> > - | URB_FREE_BUFFER         | 0x00000100 | yes     | yes       | yes      | yes         |
> > - +-------------------------+------------+---------+-----------+----------+-------------+
> > - | URB_DIR_MASK            | 0x00000200 | yes     | yes       | yes      | yes         |
> > - +-------------------------+------------+---------+-----------+----------+-------------+
> > +USBIP_CMD_SUBMIT:
> > +	Submit an URB
> > ++-----------+--------+---------------------------------------------------+
> > +| Offset    | Length | Description                                       |
> > ++===========+========+===================================================+
> > +| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000001 |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x14      | 4      | transfer_flags: possible values depend on the     |
> > +|           |        | URB transfer_flags,                               |
> > +|           |        | but with URB_NO_TRANSFER_DMA_MAP masked           |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x18      | 4      | transfer_buffer_length:                           |
> > +|           |        | use URB transfer_buffer_length                    |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x1C      | 4      | start_frame: use URB start_frame;                 |
> > +|           |        | initial frame for ISO transfer;                   |
> > +|           |        | shall be set to 0 if not ISO transfer             |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x20      | 4      | number_of_packets: number of ISO packets;         |
> > +|           |        | shall be set to 0xffffffff if not ISO transfer    |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x24      | 4      | interval: maximum time for the request on the     |
> > +|           |        | server-side host controller                       |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x28      | 8      | setup: data bytes for USB setup, filled with      |
> > +|           |        | zeros if not used.                                |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x30      | n      | transfer_buffer.                                  |
> > +|           |        | If direction is USBIP_DIR_OUT then n equals       |
> > +|           |        | transfer_buffer_length; otherwise n equals 0.     |
> > +|           |        | For ISO transfers the padding between each ISO    |
> > +|           |        | packets is not transmitted.                       |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x30+n    | m      | iso_packet_descriptor                             |
> > ++-----------+--------+---------------------------------------------------+
> >   USBIP_RET_SUBMIT:
> >   	Reply for submitting an URB
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| Offset    | Length | Value      | Description                                       |
> > -+===========+========+============+===================================================+
> > -| 0         | 4      | 0x00000003 | command                                           |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 4         | 4      |            | seqnum: URB sequence number                       |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 8         | 4      |            | devid                                             |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0xC       | 4      |            | direction:                                        |
> > -|           |        |            |                                                   |
> > -|           |        |            |    - 0: USBIP_DIR_OUT                             |
> > -|           |        |            |    - 1: USBIP_DIR_IN                              |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x10      | 4      |            | ep: endpoint number                               |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x14      | 4      |            | status: zero for successful URB transaction,      |
> > -|           |        |            | otherwise some kind of error happened.            |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x18      | 4      | n          | actual_length: number of URB data bytes           |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x1C      | 4      |            | start_frame: for an ISO frame the actually        |
> > -|           |        |            | selected frame for transmit.                      |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x20      | 4      |            | number_of_packets                                 |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x24      | 4      |            | error_count                                       |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x28      | 8      |            | setup: data bytes for USB setup, filled with      |
> > -|           |        |            | zeros if not used                                 |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x30      | n      |            | URB data bytes. For ISO transfers the padding     |
> > -|           |        |            | between each ISO packets is not transmitted.      |
> > -+-----------+--------+------------+---------------------------------------------------+
> > ++-----------+--------+---------------------------------------------------+
> > +| Offset    | Length | Description                                       |
> > ++===========+========+===================================================+
> > +| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000003 |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x14      | 4      | status: zero for successful URB transaction,      |
> > +|           |        | otherwise some kind of error happened.            |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x18      | 4      | actual_length: number of URB data bytes;          |
> > +|           |        | use URB actual_length                             |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x1C      | 4      | start_frame: use URB start_frame;                 |
> > +|           |        | initial frame for ISO transfer;                   |
> > +|           |        | shall be set to 0 if not ISO transfer             |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x20      | 4      | number_of_packets: number of ISO packets;         |
> > +|           |        | shall be set to 0xffffffff if not ISO transfer    |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x24      | 4      | error_count                                       |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x28      | 8      | padding, shall be set to 0                        |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x30      | n      | transfer_buffer.                                  |
> > +|           |        | If direction is USBIP_DIR_IN then n equals        |
> > +|           |        | actual_length; otherwise n equals 0.              |
> > +|           |        | For ISO transfers the padding between each ISO    |
> > +|           |        | packets is not transmitted.                       |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x30+n    | m      | iso_packet_descriptor                             |
> > ++-----------+--------+---------------------------------------------------+
> >   USBIP_CMD_UNLINK:
> >   	Unlink an URB
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| Offset    | Length | Value      | Description                                       |
> > -+===========+========+============+===================================================+
> > -| 0         | 4      | 0x00000002 | command: URB unlink command                       |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 4         | 4      |            | seqnum: URB sequence number to unlink:            |
> > -|           |        |            |                                                   |
> > -|           |        |            | FIXME:                                            |
> > -|           |        |            |    is this so?                                    |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 8         | 4      |            | devid                                             |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0xC       | 4      |            | direction:                                        |
> > -|           |        |            |                                                   |
> > -|           |        |            |    - 0: USBIP_DIR_OUT                             |
> > -|           |        |            |    - 1: USBIP_DIR_IN                              |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x10      | 4      |            | ep: endpoint number: zero                         |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x14      | 4      |            | seqnum: the URB sequence number given previously  |
> > -|           |        |            | at USBIP_CMD_SUBMIT.seqnum field                  |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x30      | n      |            | URB data bytes. For ISO transfers the padding     |
> > -|           |        |            | between each ISO packets is not transmitted.      |
> > -+-----------+--------+------------+---------------------------------------------------+
> > ++-----------+--------+---------------------------------------------------+
> > +| Offset    | Length | Description                                       |
> > ++===========+========+===================================================+
> > +| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000002 |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x14      | 4      | unlink_seqnum, of the SUBMIT request to unlink    |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x18      | 24     | padding, shall be set to 0                        |
> > ++-----------+--------+---------------------------------------------------+
> >   USBIP_RET_UNLINK:
> >   	Reply for URB unlink
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| Offset    | Length | Value      | Description                                       |
> > -+===========+========+============+===================================================+
> > -| 0         | 4      | 0x00000004 | command: reply for the URB unlink command         |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 4         | 4      |            | seqnum: the unlinked URB sequence number          |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 8         | 4      |            | devid                                             |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0xC       | 4      |            | direction:                                        |
> > -|           |        |            |                                                   |
> > -|           |        |            |    - 0: USBIP_DIR_OUT                             |
> > -|           |        |            |    - 1: USBIP_DIR_IN                              |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x10      | 4      |            | ep: endpoint number                               |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x14      | 4      |            | status: This is the value contained in the        |
> > -|           |        |            | urb->status in the URB completition handler.      |
> > -|           |        |            |                                                   |
> > -|           |        |            | FIXME:                                            |
> > -|           |        |            |      a better explanation needed.                 |
> > -+-----------+--------+------------+---------------------------------------------------+
> > -| 0x30      | n      |            | URB data bytes. For ISO transfers the padding     |
> > -|           |        |            | between each ISO packets is not transmitted.      |
> > -+-----------+--------+------------+---------------------------------------------------+
> > ++-----------+--------+---------------------------------------------------+
> > +| Offset    | Length | Description                                       |
> > ++===========+========+===================================================+
> > +| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000004 |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x14      | 4      | status: This is similar to the status of          |
> > +|           |        | USBIP_RET_SUBMIT (share the same memory offset).  |
> > +|           |        | When UNLINK is successful, status is -ECONNRESET; |
> > +|           |        | when USBIP_CMD_UNLINK is after USBIP_RET_SUBMIT   |
> > +|           |        | status is 0                                       |
> > ++-----------+--------+---------------------------------------------------+
> > +| 0x18      | 24     | padding, shall be set to 0                        |
> > ++-----------+--------+---------------------------------------------------+
> > +
> > +EXAMPLE
> > +=======
> > +
> > +  The following data is captured from wire with Human Interface Devices (HID)
> > +  payload
> > +
> > +::
> > +
> > +  CmdIntrIN:  00000001 00000d05 0001000f 00000001 00000001 00000200 00000040 ffffffff 00000000 00000004 00000000 00000000
> > +  CmdIntrOUT: 00000001 00000d06 0001000f 00000000 00000001 00000000 00000040 ffffffff 00000000 00000004 00000000 00000000
> > +              ffffffff860008a784ce5ae212376300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
> > +  RetIntrOut: 00000003 00000d06 00000000 00000000 00000000 00000000 00000040 ffffffff 00000000 00000000 00000000 00000000
> > +  RetIntrIn:  00000003 00000d05 00000000 00000000 00000000 00000000 00000040 ffffffff 00000000 00000000 00000000 00000000
> > +              ffffffff860011a784ce5ae2123763612891b1020100000400000000000000000000000000000000000000000000000000000000000000000000000000000000
> > 
> 

I will submit the next version of the PATCH after all the conversations above
resolved.
