Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62DBC33CB60
	for <lists+linux-usb@lfdr.de>; Tue, 16 Mar 2021 03:26:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231442AbhCPC0B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 Mar 2021 22:26:01 -0400
Received: from mail-eopbgr1310129.outbound.protection.outlook.com ([40.107.131.129]:60257
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230502AbhCPCZm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 15 Mar 2021 22:25:42 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JMn+t0NeJgSk78elQL2koai4zKX85ACH+Dmek713Sne4t2sxvcnAIgdty8s6DpaIGA+PWdiLZtct897z7QqA1qYm5TlftKG8wknAdmdueKwxenp14OpXW3DBxycB0opBfNC/AUs8I3ZUMYfAm3serAFqFwdlbQR2apYB8dp3s5Psf8wtXCCEDp4XCXnBqBLJFPkc9+U+CetWqFKNeEuW52hMZrwVeFr0QXOQdNat12gEPK9F9y3aBT6R6Lye6ROtykQgjBGhF1eLQ6WYMUqP27CUtOFYpYDi33GKVH0fz4FKJm3h0F0T82ukCTXUrPPb1u/HSwmitE9xTtjZ/TKvjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TI+0ZBkoau8UXkbXWMUPNwgz6vo1g5fCF9dvnH8Efw=;
 b=U2lDQdLhToZRd3Q20GwWzG8dVaNptRjhRka8gibKZWVXcECXUMaNSTMfFilUbSIyNXXHd2dtlUBcID0cH5pnZSWdxnlUXFLqN+vDxOoqZfFqlTXfQisEsB8fAZ/NLJRBJfhnxj5kRL1TJ4kL4fnHmT1JmRtWxjfvxEXGi5UZQrCaUZxriXkZPVrYCqUvRc/ntPp8uQfc7AHACvaVEKDLG8xA+0IxGuV+1t2Sv6HhDKwKFUs6C0wqOsMcwGFtTiq5SnOYOVrbzn6t+UviaAvFk/TlIb1/FZmzWi3Ojqsz24q2aW+CzCI3sbPiY+JUcRyAfF/GNzmsGzZf8PLTbYeXuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=zenithal.me; dmarc=pass action=none header.from=zenithal.me;
 dkim=pass header.d=zenithal.me; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tsinghuau.onmicrosoft.com; s=selector1-tsinghuau-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TI+0ZBkoau8UXkbXWMUPNwgz6vo1g5fCF9dvnH8Efw=;
 b=BwqyjRIJabz+Exbhhbs7dwxWUuu4rVhdIftA72V4aAHZma7BHUyxV076osBsE+7WCE3htYmzv5eLeuQ7PmVb1CGQkH7t8xlZeqrFTgk0ihhVuh5AlCBuI2OD+pvSwW16/MvYzwGneYNrWQipG5woCM2Oyv6uIMLCy44dLEvtios=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=zenithal.me;
Received: from HK0PR03MB3795.apcprd03.prod.outlook.com (2603:1096:203:3c::10)
 by HK0PR03MB5107.apcprd03.prod.outlook.com (2603:1096:203:ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.11; Tue, 16 Mar
 2021 02:25:37 +0000
Received: from HK0PR03MB3795.apcprd03.prod.outlook.com
 ([fe80::8492:e28e:e777:6d05]) by HK0PR03MB3795.apcprd03.prod.outlook.com
 ([fe80::8492:e28e:e777:6d05%6]) with mapi id 15.20.3955.011; Tue, 16 Mar 2021
 02:25:37 +0000
Date:   Tue, 16 Mar 2021 10:25:28 +0800
From:   "Hongren Zheng (Zenithal)" <i@zenithal.me>
To:     Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?iso-8859-1?Q?M=E1rton_N=E9meth?= <nm127@freemail.hu>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     Alexandre Demers <alexandre.f.demers@gmail.com>,
        linux-usb@vger.kernel.org, usbip-devel@lists.sourceforge.net,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH v5] docs: usbip: Fix major fields and descriptions in protocol
Message-ID: <YFAXGBSxaZJ8Dy3/@Sun>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YE/Od9WNg3Prw1/h@Sun>
X-Operating-System: Linux Sun 5.10.19-1-lts
X-Mailer: Mutt 2.0.5 (da5e3282) (2021-01-21)
X-Originating-IP: [2402:f000:6:6009::11]
X-ClientProxiedBy: BYAPR05CA0070.namprd05.prod.outlook.com
 (2603:10b6:a03:74::47) To HK0PR03MB3795.apcprd03.prod.outlook.com
 (2603:1096:203:3c::10)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost (2402:f000:6:6009::11) by BYAPR05CA0070.namprd05.prod.outlook.com (2603:10b6:a03:74::47) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.10 via Frontend Transport; Tue, 16 Mar 2021 02:25:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e0bfd53b-f0be-45d7-3b63-08d8e822c8d1
X-MS-TrafficTypeDiagnostic: HK0PR03MB5107:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR03MB510713C49B3E65633179E068BC6B9@HK0PR03MB5107.apcprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XpdZ4COo1EQOwT3qs11iGF/RR8etVGu8bR7mkPXiFHU1H6ZUMQVG+tv0Os9og8EjRuMNcTfdHrXw/wD5RBC9zX+t7KPhzMdJeNnkrpAw+bAeJJASvaxLRP7XrnUUwWmuEi23wfxf+rHZxBjZ+5NZMAC384KLWdJ7B8aK07zkg+859CBMjMqLLEJ69NGgDrE+IaVj2ps525+DhPa4L2pqK1Z8FGGqgzggURgaeeJ7K/+OdiI7n+JMyAwBLKNq53SCyjimbBhbJQc0R77WRvUzVO6hHLsQXDQDsPrWMCwMrYEq972FSw5u8lPmPrAyBzyOfMUo3VUbEwHJg+OUs75urn7LcWASaG+zBrAmjiItKaVkmjAeDDsaj9h6E6QlHCPwZ+N32JDXfj+R9uKgdqENX5dzglNbVAmMlW6wMW+5omlHphiUnYoTsFW2b+/y412EtZoKDffrcw5HHhFTIuRWGkBbPlpm3WGly1SUDybhCb6xD98BDwE8F2Gzp3iv6D9fPBS5ZWBJlSWiJUOOCZXIOFVR8aFG3cNcGJDtfUf+/a8F03ZAgYuE8g4Dt/HO119hyEV21yWC22xpd1CwCC/diu4oHal3khQCMqZBwF/UyQW5zXIDVLrXo5QYJXvfQBDttX5034CiEt6CgmdPRr8E3I3YJfxwBAqUgIvXtUrdGfK3lMZzxqU9ErPfMqZHmYGi
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:HK0PR03MB3795.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(136003)(346002)(39830400003)(366004)(396003)(376002)(966005)(8936002)(5660300002)(4326008)(83380400001)(54906003)(8676002)(110136005)(30864003)(52116002)(6486002)(786003)(7416002)(316002)(186003)(6666004)(86362001)(16526019)(6496006)(478600001)(2906002)(66556008)(66946007)(9686003)(66476007)(33716001)(49092004);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?oy/yIHqmiX+n+LUqbWeERi7oKTfdw2LpBE6sUPLUo86J9S+LOvztvO0dRm1p?=
 =?us-ascii?Q?CJs9yfd/tswyk5/W9qXTwTbKyf7gaVm+9Sj231XbOXxQGxIzYPiEkqtE6lkd?=
 =?us-ascii?Q?nqiuMRFAf1OCey77icDaDyqzrcJBN9ac6EA7Hyr6sA3o7hVNslt9sw6Peeph?=
 =?us-ascii?Q?gozHPRD4EJU7cLcbVz58WnBtUNvJg/7ZN+sbfwKpRfZoHxPSDFJxjChyCNir?=
 =?us-ascii?Q?0Msn7SrUx4BfIMhO1UjjCl5tf6+wSbn9+P3GolttVQf589NhPYr8WGt2mj7M?=
 =?us-ascii?Q?wnVQWcM2EsFJ6ZsB00icPcaWjYdEy736UrKmhVgYqJhE6D9tRtL92AlGqriq?=
 =?us-ascii?Q?tGlaVPsuOyMUg8BxJaP9Dh4+ksVQ5ri2MDcd2Whdk3eHbMQrWBi/bxokfqI6?=
 =?us-ascii?Q?EHuNi91+BFFgMqANKRePsRVSARdGiUE5Dx1Bb05HLudAVWir+vr+pjxiWjcw?=
 =?us-ascii?Q?3F85oDOXavAL6LcZPAvhEgAGn3A5Qax7SlBlX6vFyG/f1/nrgKBsgEnN88Sn?=
 =?us-ascii?Q?bB81Cr7jnG2IETzH9N15QKU9VjnOaahtcVeX4bnC7A8q6l4pHetRrW4H6GUt?=
 =?us-ascii?Q?1DN/RUPBu5lxbJUOMIJ5U+NRjKZXt8h9ciKmDvCvmAzvDVa0MCEccn1N8u5/?=
 =?us-ascii?Q?l6msDIB+Un9cRa3DEJFJVj4Xzsx3fqnt/MNSZxH+RnilrFNE0FhjWzIhdDX2?=
 =?us-ascii?Q?9AGN8B0F3un7kYefr91IlIRAlBxKjg489w80kvcJp+LprgRPlkKwS95ECP/S?=
 =?us-ascii?Q?uxUmdWh3qo6E5ag8lg5eKcehPTcqPMWdtcPgHEy8s9+vuOd56zYlArncpZPD?=
 =?us-ascii?Q?hXksged/LDXxhUArbK64lnKIU/4PdUvejYDD/IPlPryjOEGNg8G+blgmhraO?=
 =?us-ascii?Q?gaarCLAvWTWNGfBJnJvA0PpyUgcJ5AslHkgO2+IsQS6GiMP62YlLSG+K/FtZ?=
 =?us-ascii?Q?T7Givto80x2dCtplmxZUYw0dV38H2pXXMr3nf3dmFkZVXbJ/0U0LKNBz1HQz?=
 =?us-ascii?Q?TtbqVKBDIEGHfy4toolNlaiNhaFdhnDRqf1QHi9C+sTF9ZKafgCjyM4ql3K2?=
 =?us-ascii?Q?psOE0GmVAG0JLZbbrEsVWaqxDoYvLlQkTGAmNh2IroMY5aWXoL06bnF5tqec?=
 =?us-ascii?Q?9k96m9HMX5iPBWL8TH6O9X8hlTE/YhlUwj0iV6Tf8FKS6DzCceLldd4BXlQp?=
 =?us-ascii?Q?ka5H7B7Z+4VEC7a9GGmTCWjlWBuD9TzY6kloVCaZE8CWYRmbSF8NbJYdjr8q?=
 =?us-ascii?Q?N3LCnjmkhm6RXXa7rUF6ZXPDNFw/5YdySNgAPBTrLqaZXpV1zuQ+pZVhzrSQ?=
 =?us-ascii?Q?sSWk+wNyb7mupRVHdr5sTw6nBccFPD+xonta3T6SGV9qBA=3D=3D?=
X-OriginatorOrg: zenithal.me
X-MS-Exchange-CrossTenant-Network-Message-Id: e0bfd53b-f0be-45d7-3b63-08d8e822c8d1
X-MS-Exchange-CrossTenant-AuthSource: HK0PR03MB3795.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 02:25:37.4092
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 436d481c-43b1-4418-8d7f-84c1e4887cf0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZyTFwynODsIkdprJL0dDRbKVPZj5dipHxqNCc2YfpvpHdyjLnMLAtysmmgxBsOT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR03MB5107
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

The old document for usbip protocol is misleading and hard to read:
  * Some fields in header are incorrect
  * Explanation of some fields are unclear or even wrong
  * Padding of header (namely all headers have the same length) is
    not explicitly pointed out, which is crucial for stream protocol
    like TCP

Major changes:
  * Document the correct field as described in the codebase.
  * Document the padding in usbip headers. This is crucial for TCP
    stream hence these padding should be explicitly point out.
    In code these padding are implemented by a union of all headers.
  * Fix two FIXME related to usbip unlink and Document the behavior
    of unlink in different situation.
  * Clarify some field with more accurate explanation, like those
    fields associated with URB. Some constraints are extracted from
    code.
  * Delete specific transfer_flag doc in usbip as it should be
    documented by the URB part.
  * Add data captured from wire as example

Co-developed-by: Alexandre Demers <alexandre.f.demers@gmail.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Hongren Zheng <i@zenithal.me>
---
 Documentation/usb/usbip_protocol.rst | 320 ++++++++++++++-------------
 1 file changed, 171 insertions(+), 149 deletions(-)

PATCH v2:
Some changes suggested by a previous patch in
https://lore.kernel.org/linux-usb
/20180128071514.9107-1-alexandre.f.demers@gmail.com/
is adopted in this patch.
  * Fix Typo: duplicated 'the' in 'the following 4 field'
  * Fix incorrect field: in OP_REQ_DEVLIST, the second dev starts with
    field 'path', not 'busid'

PATCH v3:
Suggested by
https://lore.kernel.org/linux-doc/YE8Oan2BmSuKR4%2Fp@kroah.com/
  * Remove date and changelog in doc as these are tracked in git history
  * Remove 'mistake alert' as all data fields are documented properly
    now. However, docs on possible values for some field shall be added
    in the future

PATCH v4:
Suggested by https://lore.kernel.org/linux-doc
/40351ed6-2907-3966-e69a-a564173b3682@infradead.org/
  * Add punctuations for readability
  * Move patch changelog after the marker line
  * Remove nickname in signed-off-by line

PATCH v5:
  * Instead of co-developed-by, use reviewed-by
    for Randy Dunlap

diff --git a/Documentation/usb/usbip_protocol.rst b/Documentation/usb/usbip_protocol.rst
index 988c832166cd..54c5677adf4e 100644
--- a/Documentation/usb/usbip_protocol.rst
+++ b/Documentation/usb/usbip_protocol.rst
@@ -2,11 +2,11 @@
 USB/IP protocol
 ===============
 
-PRELIMINARY DRAFT, MAY CONTAIN MISTAKES!
-28 Jun 2011
+Architecture
+============
 
 The USB/IP protocol follows a server/client architecture. The server exports the
-USB devices and the clients imports them. The device driver for the exported
+USB devices and the client imports them. The device driver for the exported
 USB device runs on the client machine.
 
 The client may ask for the list of the exported USB devices. To get the list the
@@ -37,6 +37,9 @@ to transfer the URB traffic between the client and the server. The client may
 send two types of packets: the USBIP_CMD_SUBMIT to submit an URB, and
 USBIP_CMD_UNLINK to unlink a previously submitted URB. The answers of the
 server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
+Note that after successful USBIP_RET_UNLINK, the unlinked URB request would not
+have a corresponding USBIP_RET_UNLINK (this is explained in
+drivers/usb/usbip/stub_rx.c).
 
 ::
 
@@ -85,16 +88,42 @@ server may be USBIP_RET_SUBMIT and USBIP_RET_UNLINK respectively.
           |                        .                        |
           |                        :                        |
           |                                                 |
+          |            USBIP_CMD_SUBMIT(seqnum = p)         |
+          | ----------------------------------------------> |
+          |                                                 |
+          |               USBIP_CMD_UNLINK                  |
+          |         (seqnum = p+1, unlink_seqnum = p)       |
+          | ----------------------------------------------> |
+          |                                                 |
+          |               USBIP_RET_UNLINK                  |
+          |        (seqnum = p+1, status = -ECONNRESET)     |
+          | <---------------------------------------------- |
+          |                                                 |
+          |         Note: No USBIP_RET_SUBMIT(seqnum = p)   |
+          | <--X---X---X---X---X---X---X---X---X---X---X--- |
+          |                        .                        |
+          |                        :                        |
+          |                                                 |
+          |            USBIP_CMD_SUBMIT(seqnum = q)         |
+          | ----------------------------------------------> |
+          |                                                 |
+          |            USBIP_RET_SUBMIT(seqnum = q)         |
+          | <---------------------------------------------- |
+          |                                                 |
           |               USBIP_CMD_UNLINK                  |
+          |         (seqnum = q+1, unlink_seqnum = q)       |
           | ----------------------------------------------> |
           |                                                 |
           |               USBIP_RET_UNLINK                  |
+          |           (seqnum = q+1, status = 0)            |
           | <---------------------------------------------- |
           |                                                 |
 
 The fields are in network (big endian) byte order meaning that the most significant
 byte (MSB) is stored at the lowest address.
 
+Message Format
+==============
 
 OP_REQ_DEVLIST:
 	Retrieve the list of exported USB devices.
@@ -102,7 +131,7 @@ OP_REQ_DEVLIST:
 +-----------+--------+------------+---------------------------------------------------+
 | Offset    | Length | Value      | Description                                       |
 +===========+========+============+===================================================+
-| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0 |
+| 0         | 2      | 0x0111     | Binary-coded decimal USBIP version number: v1.1.1 |
 +-----------+--------+------------+---------------------------------------------------+
 | 2         | 2      | 0x8005     | Command code: Retrieve the list of exported USB   |
 |           |        |            | devices.                                          |
@@ -116,7 +145,7 @@ OP_REP_DEVLIST:
 +-----------+--------+------------+---------------------------------------------------+
 | Offset    | Length | Value      | Description                                       |
 +===========+========+============+===================================================+
-| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0.|
+| 0         | 2      | 0x0111     | Binary-coded decimal USBIP version number: v1.1.1 |
 +-----------+--------+------------+---------------------------------------------------+
 | 2         | 2      | 0x0005     | Reply code: The list of exported USB devices.     |
 +-----------+--------+------------+---------------------------------------------------+
@@ -165,8 +194,8 @@ OP_REP_DEVLIST:
 | 0x143     | 1      |            | bNumInterfaces                                    |
 +-----------+--------+------------+---------------------------------------------------+
 | 0x144     |        | m_0        | From now on each interface is described, all      |
-|           |        |            | together bNumInterfaces times, with the           |
-|           |        |            | the following 4 fields:                           |
+|           |        |            | together bNumInterfaces times, with the following |
+|           |        |            | 4 fields:                                         |
 +-----------+--------+------------+---------------------------------------------------+
 |           | 1      |            | bInterfaceClass                                   |
 +-----------+--------+------------+---------------------------------------------------+
@@ -177,7 +206,7 @@ OP_REP_DEVLIST:
 | 0x147     | 1      |            | padding byte for alignment, shall be set to zero  |
 +-----------+--------+------------+---------------------------------------------------+
 | 0xC +     |        |            | The second exported USB device starts at i=1      |
-| i*0x138 + |        |            | with the busid field.                             |
+| i*0x138 + |        |            | with the path field.                              |
 | m_(i-1)*4 |        |            |                                                   |
 +-----------+--------+------------+---------------------------------------------------+
 
@@ -187,7 +216,7 @@ OP_REQ_IMPORT:
 +-----------+--------+------------+---------------------------------------------------+
 | Offset    | Length | Value      | Description                                       |
 +===========+========+============+===================================================+
-| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0 |
+| 0         | 2      | 0x0111     | Binary-coded decimal USBIP version number: v1.1.1 |
 +-----------+--------+------------+---------------------------------------------------+
 | 2         | 2      | 0x8003     | Command code: import a remote USB device.         |
 +-----------+--------+------------+---------------------------------------------------+
@@ -206,7 +235,7 @@ OP_REP_IMPORT:
 +-----------+--------+------------+---------------------------------------------------+
 | Offset    | Length | Value      | Description                                       |
 +===========+========+============+===================================================+
-| 0         | 2      | 0x0100     | Binary-coded decimal USBIP version number: v1.0.0 |
+| 0         | 2      | 0x0111     | Binary-coded decimal USBIP version number: v1.1.1 |
 +-----------+--------+------------+---------------------------------------------------+
 | 2         | 2      | 0x0003     | Reply code: Reply to import.                      |
 +-----------+--------+------------+---------------------------------------------------+
@@ -254,158 +283,151 @@ OP_REP_IMPORT:
 | 0x13E     | 1      |            | bNumInterfaces                                    |
 +-----------+--------+------------+---------------------------------------------------+
 
-USBIP_CMD_SUBMIT:
-	Submit an URB
+The following four commands have a common basic header called
+'usbip_header_basic', and their headers, called 'usbip_header' (before URB
+payload), have the same length, therefore paddings are needed.
 
-+-----------+--------+------------+---------------------------------------------------+
-| Offset    | Length | Value      | Description                                       |
-+===========+========+============+===================================================+
-| 0         | 4      | 0x00000001 | command: Submit an URB                            |
-+-----------+--------+------------+---------------------------------------------------+
-| 4         | 4      |            | seqnum: the sequence number of the URB to submit  |
-+-----------+--------+------------+---------------------------------------------------+
-| 8         | 4      |            | devid                                             |
-+-----------+--------+------------+---------------------------------------------------+
-| 0xC       | 4      |            | direction:                                        |
-|           |        |            |                                                   |
-|           |        |            |    - 0: USBIP_DIR_OUT                             |
-|           |        |            |    - 1: USBIP_DIR_IN                              |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x10      | 4      |            | ep: endpoint number, possible values are: 0...15  |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x14      | 4      |            | transfer_flags: possible values depend on the     |
-|           |        |            | URB transfer type, see below                      |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x18      | 4      |            | transfer_buffer_length                            |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x1C      | 4      |            | start_frame: specify the selected frame to        |
-|           |        |            | transmit an ISO frame, ignored if URB_ISO_ASAP    |
-|           |        |            | is specified at transfer_flags                    |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x20      | 4      |            | number_of_packets: number of ISO packets          |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x24      | 4      |            | interval: maximum time for the request on the     |
-|           |        |            | server-side host controller                       |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x28      | 8      |            | setup: data bytes for USB setup, filled with      |
-|           |        |            | zeros if not used                                 |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x30      |        |            | URB data. For ISO transfers the padding between   |
-|           |        |            | each ISO packets is not transmitted.              |
-+-----------+--------+------------+---------------------------------------------------+
+usbip_header_basic:
 
++-----------+--------+---------------------------------------------------+
+| Offset    | Length | Description                                       |
++===========+========+===================================================+
+| 0         | 4      | command                                           |
++-----------+--------+---------------------------------------------------+
+| 4         | 4      | seqnum: sequential number that identifies requests|
+|           |        | and corresponding responses;                      |
+|           |        | incremented per connection                        |
++-----------+--------+---------------------------------------------------+
+| 8         | 4      | devid: specifies a remote USB device uniquely     |
+|           |        | instead of busnum and devnum;                     |
+|           |        | for client (request), this value is               |
+|           |        | ((busnum << 16) | devnum);                        |
+|           |        | for server (response), this shall be set to 0     |
++-----------+--------+---------------------------------------------------+
+| 0xC       | 4      | direction:                                        |
+|           |        |                                                   |
+|           |        |    - 0: USBIP_DIR_OUT                             |
+|           |        |    - 1: USBIP_DIR_IN                              |
+|           |        |                                                   |
+|           |        | only used by client, for server this shall be 0   |
++-----------+--------+---------------------------------------------------+
+| 0x10      | 4      | ep: endpoint number                               |
+|           |        | only used by client, for server this shall be 0;  |
+|           |        | for UNLINK, this shall be 0                       |
++-----------+--------+---------------------------------------------------+
 
- +-------------------------+------------+---------+-----------+----------+-------------+
- | Allowed transfer_flags  | value      | control | interrupt | bulk     | isochronous |
- +=========================+============+=========+===========+==========+=============+
- | URB_SHORT_NOT_OK        | 0x00000001 | only in | only in   | only in  | no          |
- +-------------------------+------------+---------+-----------+----------+-------------+
- | URB_ISO_ASAP            | 0x00000002 | no      | no        | no       | yes         |
- +-------------------------+------------+---------+-----------+----------+-------------+
- | URB_NO_TRANSFER_DMA_MAP | 0x00000004 | yes     | yes       | yes      | yes         |
- +-------------------------+------------+---------+-----------+----------+-------------+
- | URB_ZERO_PACKET         | 0x00000040 | no      | no        | only out | no          |
- +-------------------------+------------+---------+-----------+----------+-------------+
- | URB_NO_INTERRUPT        | 0x00000080 | yes     | yes       | yes      | yes         |
- +-------------------------+------------+---------+-----------+----------+-------------+
- | URB_FREE_BUFFER         | 0x00000100 | yes     | yes       | yes      | yes         |
- +-------------------------+------------+---------+-----------+----------+-------------+
- | URB_DIR_MASK            | 0x00000200 | yes     | yes       | yes      | yes         |
- +-------------------------+------------+---------+-----------+----------+-------------+
+USBIP_CMD_SUBMIT:
+	Submit an URB
 
++-----------+--------+---------------------------------------------------+
+| Offset    | Length | Description                                       |
++===========+========+===================================================+
+| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000001 |
++-----------+--------+---------------------------------------------------+
+| 0x14      | 4      | transfer_flags: possible values depend on the     |
+|           |        | URB transfer_flags,                               |
+|           |        | but with URB_NO_TRANSFER_DMA_MAP masked           |
++-----------+--------+---------------------------------------------------+
+| 0x18      | 4      | transfer_buffer_length:                           |
+|           |        | use URB transfer_buffer_length                    |
++-----------+--------+---------------------------------------------------+
+| 0x1C      | 4      | start_frame: use URB start_frame;                 |
+|           |        | initial frame for ISO transfer;                   |
+|           |        | shall be set to 0 if not ISO transfer             |
++-----------+--------+---------------------------------------------------+
+| 0x20      | 4      | number_of_packets: number of ISO packets;         |
+|           |        | shall be set to 0xffffffff if not ISO transfer    |
++-----------+--------+---------------------------------------------------+
+| 0x24      | 4      | interval: maximum time for the request on the     |
+|           |        | server-side host controller                       |
++-----------+--------+---------------------------------------------------+
+| 0x28      | 8      | setup: data bytes for USB setup, filled with      |
+|           |        | zeros if not used.                                |
++-----------+--------+---------------------------------------------------+
+| 0x30      | n      | transfer_buffer.                                  |
+|           |        | If direction is USBIP_DIR_OUT then n equals       |
+|           |        | transfer_buffer_length; otherwise n equals 0.     |
+|           |        | For ISO transfers the padding between each ISO    |
+|           |        | packets is not transmitted.                       |
++-----------+--------+---------------------------------------------------+
+| 0x30+n    | m      | iso_packet_descriptor                             |
++-----------+--------+---------------------------------------------------+
 
 USBIP_RET_SUBMIT:
 	Reply for submitting an URB
 
-+-----------+--------+------------+---------------------------------------------------+
-| Offset    | Length | Value      | Description                                       |
-+===========+========+============+===================================================+
-| 0         | 4      | 0x00000003 | command                                           |
-+-----------+--------+------------+---------------------------------------------------+
-| 4         | 4      |            | seqnum: URB sequence number                       |
-+-----------+--------+------------+---------------------------------------------------+
-| 8         | 4      |            | devid                                             |
-+-----------+--------+------------+---------------------------------------------------+
-| 0xC       | 4      |            | direction:                                        |
-|           |        |            |                                                   |
-|           |        |            |    - 0: USBIP_DIR_OUT                             |
-|           |        |            |    - 1: USBIP_DIR_IN                              |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x10      | 4      |            | ep: endpoint number                               |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x14      | 4      |            | status: zero for successful URB transaction,      |
-|           |        |            | otherwise some kind of error happened.            |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x18      | 4      | n          | actual_length: number of URB data bytes           |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x1C      | 4      |            | start_frame: for an ISO frame the actually        |
-|           |        |            | selected frame for transmit.                      |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x20      | 4      |            | number_of_packets                                 |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x24      | 4      |            | error_count                                       |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x28      | 8      |            | setup: data bytes for USB setup, filled with      |
-|           |        |            | zeros if not used                                 |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x30      | n      |            | URB data bytes. For ISO transfers the padding     |
-|           |        |            | between each ISO packets is not transmitted.      |
-+-----------+--------+------------+---------------------------------------------------+
++-----------+--------+---------------------------------------------------+
+| Offset    | Length | Description                                       |
++===========+========+===================================================+
+| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000003 |
++-----------+--------+---------------------------------------------------+
+| 0x14      | 4      | status: zero for successful URB transaction,      |
+|           |        | otherwise some kind of error happened.            |
++-----------+--------+---------------------------------------------------+
+| 0x18      | 4      | actual_length: number of URB data bytes;          |
+|           |        | use URB actual_length                             |
++-----------+--------+---------------------------------------------------+
+| 0x1C      | 4      | start_frame: use URB start_frame;                 |
+|           |        | initial frame for ISO transfer;                   |
+|           |        | shall be set to 0 if not ISO transfer             |
++-----------+--------+---------------------------------------------------+
+| 0x20      | 4      | number_of_packets: number of ISO packets;         |
+|           |        | shall be set to 0xffffffff if not ISO transfer    |
++-----------+--------+---------------------------------------------------+
+| 0x24      | 4      | error_count                                       |
++-----------+--------+---------------------------------------------------+
+| 0x28      | 8      | padding, shall be set to 0                        |
++-----------+--------+---------------------------------------------------+
+| 0x30      | n      | transfer_buffer.                                  |
+|           |        | If direction is USBIP_DIR_IN then n equals        |
+|           |        | actual_length; otherwise n equals 0.              |
+|           |        | For ISO transfers the padding between each ISO    |
+|           |        | packets is not transmitted.                       |
++-----------+--------+---------------------------------------------------+
+| 0x30+n    | m      | iso_packet_descriptor                             |
++-----------+--------+---------------------------------------------------+
 
 USBIP_CMD_UNLINK:
 	Unlink an URB
 
-+-----------+--------+------------+---------------------------------------------------+
-| Offset    | Length | Value      | Description                                       |
-+===========+========+============+===================================================+
-| 0         | 4      | 0x00000002 | command: URB unlink command                       |
-+-----------+--------+------------+---------------------------------------------------+
-| 4         | 4      |            | seqnum: URB sequence number to unlink:            |
-|           |        |            |                                                   |
-|           |        |            | FIXME:                                            |
-|           |        |            |    is this so?                                    |
-+-----------+--------+------------+---------------------------------------------------+
-| 8         | 4      |            | devid                                             |
-+-----------+--------+------------+---------------------------------------------------+
-| 0xC       | 4      |            | direction:                                        |
-|           |        |            |                                                   |
-|           |        |            |    - 0: USBIP_DIR_OUT                             |
-|           |        |            |    - 1: USBIP_DIR_IN                              |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x10      | 4      |            | ep: endpoint number: zero                         |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x14      | 4      |            | seqnum: the URB sequence number given previously  |
-|           |        |            | at USBIP_CMD_SUBMIT.seqnum field                  |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x30      | n      |            | URB data bytes. For ISO transfers the padding     |
-|           |        |            | between each ISO packets is not transmitted.      |
-+-----------+--------+------------+---------------------------------------------------+
++-----------+--------+---------------------------------------------------+
+| Offset    | Length | Description                                       |
++===========+========+===================================================+
+| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000002 |
++-----------+--------+---------------------------------------------------+
+| 0x14      | 4      | unlink_seqnum, of the SUBMIT request to unlink    |
++-----------+--------+---------------------------------------------------+
+| 0x18      | 24     | padding, shall be set to 0                        |
++-----------+--------+---------------------------------------------------+
 
 USBIP_RET_UNLINK:
 	Reply for URB unlink
 
-+-----------+--------+------------+---------------------------------------------------+
-| Offset    | Length | Value      | Description                                       |
-+===========+========+============+===================================================+
-| 0         | 4      | 0x00000004 | command: reply for the URB unlink command         |
-+-----------+--------+------------+---------------------------------------------------+
-| 4         | 4      |            | seqnum: the unlinked URB sequence number          |
-+-----------+--------+------------+---------------------------------------------------+
-| 8         | 4      |            | devid                                             |
-+-----------+--------+------------+---------------------------------------------------+
-| 0xC       | 4      |            | direction:                                        |
-|           |        |            |                                                   |
-|           |        |            |    - 0: USBIP_DIR_OUT                             |
-|           |        |            |    - 1: USBIP_DIR_IN                              |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x10      | 4      |            | ep: endpoint number                               |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x14      | 4      |            | status: This is the value contained in the        |
-|           |        |            | urb->status in the URB completition handler.      |
-|           |        |            |                                                   |
-|           |        |            | FIXME:                                            |
-|           |        |            |      a better explanation needed.                 |
-+-----------+--------+------------+---------------------------------------------------+
-| 0x30      | n      |            | URB data bytes. For ISO transfers the padding     |
-|           |        |            | between each ISO packets is not transmitted.      |
-+-----------+--------+------------+---------------------------------------------------+
++-----------+--------+---------------------------------------------------+
+| Offset    | Length | Description                                       |
++===========+========+===================================================+
+| 0         | 20     | usbip_header_basic, 'command' shall be 0x00000004 |
++-----------+--------+---------------------------------------------------+
+| 0x14      | 4      | status: This is similar to the status of          |
+|           |        | USBIP_RET_SUBMIT (share the same memory offset).  |
+|           |        | When UNLINK is successful, status is -ECONNRESET; |
+|           |        | when USBIP_CMD_UNLINK is after USBIP_RET_SUBMIT   |
+|           |        | status is 0                                       |
++-----------+--------+---------------------------------------------------+
+| 0x18      | 24     | padding, shall be set to 0                        |
++-----------+--------+---------------------------------------------------+
+
+EXAMPLE
+=======
+
+  The following data is captured from wire with Human Interface Devices (HID)
+  payload
+
+::
+
+  CmdIntrIN:  00000001 00000d05 0001000f 00000001 00000001 00000200 00000040 ffffffff 00000000 00000004 00000000 00000000
+  CmdIntrOUT: 00000001 00000d06 0001000f 00000000 00000001 00000000 00000040 ffffffff 00000000 00000004 00000000 00000000
+              ffffffff860008a784ce5ae212376300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
+  RetIntrOut: 00000003 00000d06 00000000 00000000 00000000 00000000 00000040 ffffffff 00000000 00000000 00000000 00000000
+  RetIntrIn:  00000003 00000d05 00000000 00000000 00000000 00000000 00000040 ffffffff 00000000 00000000 00000000 00000000
+              ffffffff860011a784ce5ae2123763612891b1020100000400000000000000000000000000000000000000000000000000000000000000000000000000000000
-- 
2.30.1

