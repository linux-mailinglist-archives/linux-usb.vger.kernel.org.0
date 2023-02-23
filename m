Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0BA1F6A02D4
	for <lists+linux-usb@lfdr.de>; Thu, 23 Feb 2023 07:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233379AbjBWGbr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Feb 2023 01:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233233AbjBWGbp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Feb 2023 01:31:45 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 045BD4A1E9
        for <linux-usb@vger.kernel.org>; Wed, 22 Feb 2023 22:31:43 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31N6Q2XV009519;
        Wed, 22 Feb 2023 22:31:40 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=EPx7p2pLrpyrILF2f0n5CzD2CIq7R9sEzzbAeO6ACmA=;
 b=aM0z5MW60oNpBx+CD2/3/daw79uD7oGdpTFVrgsrtzNCBuD9e0JjrMMLIZWBmNBYd6/H
 rSiJwA1GGphNZOFEYmoyMsPl69DxdF7EoiwGW0o1V54+Ws53z5nfdb0PBtxWn4H2/MTB
 w4Ly2PQrs//7nvF9KhXw/0onPjGKtgnarbKk8tAuI00UqJABfCpYgb1vuqbz/euR57ae
 PdfiOp2XQJ3LVQeEVRyamFz0BxsIoyPq6JJuMHoCfB+QcfutdDzSYI/CRUHpLbxalZ1L
 8eS6X5kXotIRK12es2sZ1fv5uWQ/z6Sw+cEmThS4UCg28mDl38k84aI1hSYLqGxmsbP3 Gg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3nwy7bhjnv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 22 Feb 2023 22:31:40 -0800
Received: from mailhost.synopsys.com (badc-mailhost4.synopsys.com [10.192.0.82])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id DF976400E8;
        Thu, 23 Feb 2023 06:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1677133900; bh=HyAGzABNBbOaD9JKuKliNOA0Tap7sJsS5xV2i1bfwCw=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=YalDcfQ6fZ/l2ezM5lKvbOBwF59HNhVaewetHPecLbDRSBiUIT9mmnSwDht8ENFoP
         mKmRmzI06bhzpO9m7VG5eos356D9BYUsdhgtlFNdzaaEijgVNlFU+Az9+HMbe/UWbt
         k9aDncF6VAUD0PlMyZgcjDIKshM8UsS18Cm+7OcILmOzYylCZkraspmhaYu3Xo2cZ5
         3xFs9c9H9/Whe9a2kZFgWnZ+iuKKh1ts6de+8i3Bj69kSdE+9Qb8Igh/fAxhW6pYlv
         rtYcSCXskahfkAA2iLLFg3JZCRgf5jcOWIFHbuLq0sJ2pKwvHWghakanubtF/i15qb
         aA+7jdNypptRw==
Received: from o365relay-in.synopsys.com (us03-o365relay5.synopsys.com [10.4.161.141])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id B7C05A0060;
        Thu, 23 Feb 2023 06:31:39 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2045.outbound.protection.outlook.com [104.47.57.45])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id E3A4E800A9;
        Thu, 23 Feb 2023 06:31:38 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=hminas@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="sGtIhgRx";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ItTDLpr0Y7H9uDmgBCLgojLNfCzGZwQgWYtlg8osIFJlKddS+gpdZPfo+m6xvlv0PFvFzVWzDYv70qw4kzDG8c7v7GuMLzA8KM0sI7WX25Ke5k+l6uzwJnPNWOZ+wc0dMdI+1zDL6FzUxsQp8oZXRUKt7nKdhZ+kcmIOVQc4d+oTRdS2X/qSFm+J7QvkSv1r4p5i9CAPwcDVap3bCGFb/Mvds4qxVht5YRqnlSt2eB1DwIF8HagCK/wgBymPZT0/IkJ02j9A3W4hWavJM4VtXt2qU+sXSvZq9SJ+h2MrLDelDSHE+K4wy0HCQk4n3IumbgPtSPBbTMsxohNVlxMzyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPx7p2pLrpyrILF2f0n5CzD2CIq7R9sEzzbAeO6ACmA=;
 b=UL440a/iVCg2WuE5JvMu8CGne2NOM7f+PJpdlyDkT05st2i/l1oqU09w++DwWVr/eW1d8J5e7RJIQvuXOudXN9cLSfkAz6tAObk/Pc/cMPP8orphgTuR1kLdNOGK45i0mAMGvmNyPOzPUG2c4B8K4YZX93GyKVSG0Wn92KTSZCc9E6nWMDMhn8q5N7AnqG+JaCMZ6Q9FVRXxMEicESzJxdHd+ESFPoTIKQinhbmIw7nYxmzRIunF6+lTbvnqLC/g2b5Du4nbA7xeWsEOnbYXkkLFMNEbAeOa2+ZqLX/MNBbrPPuQInn+p6Avle4GHGBsTOgrinrkjx732hsCKxW4ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPx7p2pLrpyrILF2f0n5CzD2CIq7R9sEzzbAeO6ACmA=;
 b=sGtIhgRx0K4dKPtkpU17/S94L7eRZDmvmwEdV2eRk2D5tsHZ1oQ9ZGPmZ4UUnPANgmJYGy+cyHmBzKUyHYnVQciy6oH5ZPAjTGb0zmH7UiQzDGb5nP4LcUQOToW4Uzgf2dVrIkn2Prq1EijkH68BehnOzUHymdYeQl3yH2BEEsc=
Received: from BN8PR12MB3395.namprd12.prod.outlook.com (2603:10b6:408:43::18)
 by BN9PR12MB5098.namprd12.prod.outlook.com (2603:10b6:408:137::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Thu, 23 Feb
 2023 06:31:36 +0000
Received: from BN8PR12MB3395.namprd12.prod.outlook.com
 ([fe80::797d:9b8a:39d:5a01]) by BN8PR12MB3395.namprd12.prod.outlook.com
 ([fe80::797d:9b8a:39d:5a01%3]) with mapi id 15.20.6111.020; Thu, 23 Feb 2023
 06:31:35 +0000
X-SNPS-Relay: synopsys.com
From:   Minas Harutyunyan <Minas.Harutyunyan@synopsys.com>
To:     Palak SHAH <palak.shah@raritan.com>,
        Maynard CABIENTE <maynard.cabiente@raritan.com>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: usb: gadget: dwc2: not getting audio data
Thread-Topic: usb: gadget: dwc2: not getting audio data
Thread-Index: AdlBdN39U3B888NgQMeEtY3CZon8lwFCGPXwACCHUYAAE8wZ4A==
Date:   Thu, 23 Feb 2023 06:31:35 +0000
Message-ID: <BN8PR12MB3395053B96DF2333794DBBEDA7AB9@BN8PR12MB3395.namprd12.prod.outlook.com>
References: <HE1PR0601MB25868E34AF4BA6CEAFE06F5F8DA39@HE1PR0601MB2586.eurprd06.prod.outlook.com>
 <BYAPR12MB339948C507588E0E68556ADBA7AA9@BYAPR12MB3399.namprd12.prod.outlook.com>
 <HE1PR0601MB2586BFAE94813BA86BAB12708DAA9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
In-Reply-To: <HE1PR0601MB2586BFAE94813BA86BAB12708DAA9@HE1PR0601MB2586.eurprd06.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcaG1pbmFzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctYjY0NjA2MGYtYjM0My0xMWVkLWIwNjktNWM1ZjY3?=
 =?us-ascii?Q?NjdkNDhiXGFtZS10ZXN0XGI2NDYwNjEwLWIzNDMtMTFlZC1iMDY5LTVjNWY2?=
 =?us-ascii?Q?NzY3ZDQ4YmJvZHkudHh0IiBzej0iMzY1MyIgdD0iMTMzMjE2MDc0OTMxOTUy?=
 =?us-ascii?Q?OTI5IiBoPSJYYXRoTTdBcndadFBwcjNpWU51ZzQxdGg4TE09IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFIWUlBQUFo?=
 =?us-ascii?Q?M2JCNFVFZlpBYTh6dm5WajFucjVyek8rZFdQV2V2a05BQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBSEFBQUFBR0NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBUUFCQUFBQTJXMC9vZ0FBQUFBQUFBQUFBQUFBQUo0QUFBQm1BR2tBYmdC?=
 =?us-ascii?Q?aEFHNEFZd0JsQUY4QWNBQnNBR0VBYmdCdUFHa0FiZ0JuQUY4QWR3QmhBSFFB?=
 =?us-ascii?Q?WlFCeUFHMEFZUUJ5QUdzQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFF?=
 =?us-ascii?Q?QUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FYd0J3?=
 =?us-ascii?Q?QUdFQWNnQjBBRzRBWlFCeUFITUFYd0JuQUdZQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFB?=
 =?us-ascii?Q?QUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJnQmxB?=
 =?us-ascii?Q?SElBY3dCZkFITUFZUUJ0QUhNQWRRQnVBR2NBWHdCakFHOEFiZ0JtQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFHOEFk?=
 =?us-ascii?Q?UUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBY3dCdEFH?=
 =?us-ascii?Q?a0FZd0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3?=
 =?us-ascii?Q?QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3QnpBSFFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUUJmQUhBQVlRQnlBSFFBYmdC?=
 =?us-ascii?Q?bEFISUFjd0JmQUhRQWN3QnRBR01BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJtQUc4?=
 =?us-ascii?Q?QWRRQnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVBR1VBY2dCekFGOEFkUUJ0?=
 =?us-ascii?Q?QUdNQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHY0FkQUJ6QUY4QWNBQnlBRzhB?=
 =?us-ascii?Q?WkFCMUFHTUFkQUJmQUhRQWNnQmhBR2tBYmdCcEFHNEFad0FBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
 =?us-ascii?Q?QUFBQUFBQ2VBQUFBY3dCaEFHd0FaUUJ6QUY4QVlRQmpBR01BYndCMUFHNEFk?=
 =?us-ascii?Q?QUJmQUhBQWJBQmhBRzRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQnpB?=
 =?us-ascii?Q?R0VBYkFCbEFITUFYd0J4QUhVQWJ3QjBBR1VBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUhNQWJnQndBSE1BWHdCc0FH?=
 =?us-ascii?Q?a0FZd0JsQUc0QWN3QmxBRjhBZEFCbEFISUFiUUJmQURFQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFB?=
 =?us-ascii?Q?QUNBQUFBQUFDZUFBQUFjd0J1QUhBQWN3QmZBR3dBYVFCakFHVUFiZ0J6QUdV?=
 =?us-ascii?Q?QVh3QjBBR1VBY2dCdEFGOEFjd0IwQUhVQVpBQmxBRzRBZEFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFC?=
 =?us-ascii?Q?MkFHY0FYd0JyQUdVQWVRQjNBRzhBY2dCa0FBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQSIvPjwvbWV0YT4=3D?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN8PR12MB3395:EE_|BN9PR12MB5098:EE_
x-ms-office365-filtering-correlation-id: 5d6dd9d2-ec53-44c5-6830-08db15679cca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: HQv7p0ro6lhI9PqGMKwkZyJe4hQ5sfnhHwXuJuYHvwpi6iZpuN3QAtjPTD5ibpp2ThUl1G+PpqTvzDf/kOdHaiwCT80tEXr3uQKIHAx5JMrOLrh/7/0/o/BtEHqcfSgE6le0z3fOLiKEReJtBgaQrEDU5mBgSEkuOmQcrxn4BNuMab69LfUkwB5INaJp+xS+abDXWcWPlmfil4dJBj5otBmcIGJ0lytgSKT2Kn2+Gi0SX2Sv+vQdG0lrSH0ytVn9SDmUo3xjwX0Z9uJL74uZLUmwJQIGvAKNe5Paka9fiUc/668oxFilIIpy6QVUTsSWlR5HSHRK1RckN6+JtfbQbOX6kPUCMhXPR2+m+xtByshIteV5BodEnLXHBcnqshOz/V+odeL0Sh/MiQUoWCUAjQjR+1O26T01XdT1KBKn0cliDK43NoTHvHTnJb51w1vv5NsnvGU87z0MljNiLKcwg10VFT/kwRaMez7082xxmPtHgT8t+LDqvvd51QQdFOtfqafbJHh1HzCjdayDzOmb+zW1sO3/GYb07ZgLKZaGBU3ghhKEQmihRpECr4iNjYY5YJeUBrC7XASqws/reJZnmDnuczvBzsykPul2TcNgAXxHYjVcLf7ewlQInDcB5OfqHPT1nMJ5ITb9TlgIxF2HO1jawms9X33aVwQtI78OFqCscNWNZA8m9Oio8dsEKoAEHvbRFtfrWvXW+SeN0eXYXEjkz63kNdrrL5qdDkUHUUiyv0cXj57L/veuJXXl9YwZ
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN8PR12MB3395.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199018)(2906002)(5660300002)(83380400001)(38070700005)(26005)(9686003)(122000001)(186003)(38100700002)(66946007)(66446008)(76116006)(55016003)(66476007)(64756008)(66556008)(8936002)(8676002)(316002)(4326008)(41300700001)(52536014)(33656002)(110136005)(6506007)(478600001)(86362001)(7696005)(71200400001)(473944003)(414714003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?YuxSyagqyIbDZnnJUEjpQzpC7eX62gFH8Odr2z2OVP4ygEcXRB8ydYJHeY3a?=
 =?us-ascii?Q?gR/hzE6tIj+yy4Jv715cj0/prn3P/sj75pGHar+3asEFv5FCy1mkIoHg4irS?=
 =?us-ascii?Q?7DaGesWTP0Pgb+XG34RhF9vxB17puBKzCCQ0Ry+BTloSGSy6zuwow93S6x4o?=
 =?us-ascii?Q?ttyGKW0OlqAuoD9iUdWoY6YVGzskthG7nvL1DinnxNLLQ9qLBvDdynzfnCPe?=
 =?us-ascii?Q?htn38yT6moP4RjGzWwgKnrUoqoxppCxXfic0/TdPjfCxWHQ9wJ8tRwyQvqiD?=
 =?us-ascii?Q?SjPYPFt/CNBjARMVofjsF7HrjeSZv6ixQjB6znFENvqrPLUxZxQaRxMkLtgQ?=
 =?us-ascii?Q?kBPM/2xboQ1HoVyZuSrj6p4dA483z4A4G3LTh6XgXH0uoC/T8jDLl4x1IUoB?=
 =?us-ascii?Q?c2gv/M8l5PUrMFE4/wXvsztcaSoZ0y0wyd5yiwhBAsIUPOeFLaf0hCr6AbNH?=
 =?us-ascii?Q?iAOQr5MHtiltaYm3UeMz6fXj4U/+PKl22nEXPzqC160h9oe/XCq5F6CTHoSs?=
 =?us-ascii?Q?fknKPLTf16O4pirSxy9HNhwF5qJntYEflGzdoxh4QBzTWgP/aIJp6FAw/b0I?=
 =?us-ascii?Q?BGvALSX2ZVcz49pes/vPN+0XTn6Wb/6H60qwSSvJoIG3BAww5RokM4EssWMY?=
 =?us-ascii?Q?26ky2hhujaKoIwaGKRi9uILPsiIBr634FJAlfvdPqTyDg0dkH+C+hKvWt9Be?=
 =?us-ascii?Q?Z+xMgStPNra79muzc1CDMpaVD1XCse+bXPr90M2449hgzKQ6FA3486zF9rv9?=
 =?us-ascii?Q?isJp1ZucFYuacpG7R5FYaGWGGJeTMevZB//IB+8rV5of51jLEZb8a9K6CJMQ?=
 =?us-ascii?Q?bqLxz/q8MrfxxrcnQkLnviyHpEzC3edFCGNgF4dNauaeyy3pT8QQ8U4KpCgO?=
 =?us-ascii?Q?Edh6zijkLfhNshdJXM+J+usKUtJxcIWkUEevP7hg19O+eJjpU0vySclElCKK?=
 =?us-ascii?Q?39iKkkLfAgD+PiaZ2BoZuBKBBugRiH/HyS9/fJKvzE5LIe0Aqm1x1vVgzSZ/?=
 =?us-ascii?Q?Hpn+BpJyVhgW2lANm4Q2HycyvzbKZsRgN0DkWGs4irE+tVQdGa6mEyQQnUXx?=
 =?us-ascii?Q?7N973GqSbhKQalE5LSAoRpS2EYr3gTcEwnSu0Hxks9+fOhPpfb6dMU++6dBF?=
 =?us-ascii?Q?1/8iMkVfYJyPgWJPFA0CPr4N08/AaUgJv8BNdfX0ogAgvv9sxUmEM4Z1YgKE?=
 =?us-ascii?Q?pT5iv2Ubd9gUt5rfdBHyYc+vlWqxzgV9hgmW7ExmlzJQ9tgW8IGbj7lERMSf?=
 =?us-ascii?Q?oSxIX0dDQPlDK7IBle4IF53uB7WiZCQgKdIwYD9hdu59SHCtiYWMDDsl6RLB?=
 =?us-ascii?Q?6n4jF60wEofElhrGf+SPf4Z5FfiLvPR0XspYzgq2V3SbyrV+qM2h0dbTahdv?=
 =?us-ascii?Q?LUlEW9vCCmvAZb4B5KAuDmCZ86uk8OtvSMdMGd7P7l9B+sOcPyJdnw9/Lah6?=
 =?us-ascii?Q?LxzSWuRNyURBFYzoaBJLB+V3vIRBujBnEp70Ah3PE6+aUjvUxlA2KOhayrJF?=
 =?us-ascii?Q?ixXT+RPUeTwCamgVbV5pRcoBWlnIS9Ti0U8lG44oLfBGcl9NU/LlUHBHpDr6?=
 =?us-ascii?Q?jFZ5y6cGG4xFQH7MaBz5RnF5b6dUE1gwDZO0PHhT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: NP7EWWlCGwpbFfVKl7Fy1xSGQnJmV/CKa3GzRSv0R2QWylQxmqml0Xf1qH24HBJ2Ku1GRolMUBfjJ59WfdirzIDBFU0NvPRbQtpuhWiRrkXejcGAMon3NS63cjtQCWqUWwpPFtaciwrCvvoxLMNCo2BFMmnI2xU8rKkuoTJV109mh5wgAjF6CCUnr92tn6kRqIB2uCs13rTdxnwIbz7kupDIruXMrvKU3IzBJMP3lFlpHlTU4rfeRVVek1D5OXSvGXgbTyjPd0r2LZqZa78QC4Vxrgkt3ARhcLNPYG01YrLTEv7ABabMcojeaN1v6OTC9nQm/dbE7jHo1GgD5jPrn5DcSxYgJAQkUxbwKG7OoxdtyjGSUDw87uMZWAoX9+aXTttBG33J7Jfccm3R0adkxVS+Im6FvN6pWTiIkjSvWITllP6/woG4sRIA5k6xyeMVEfAE5pqYXgbpbcqEVeJsgDg9abPWUMHQhGS+2zlk7AtPEl2lNOWcpuwTRtHKTwzDFBMK/1TgK7G1AAzAofHtQ2Vo3cm3WH1ZtYy9Ro7UTooaKFfXke2l4mShTh4+20MmlWvZpEOUzfhlvYJ1YGgoS9WkV0LQT4EfDDMYX7Ecrs/2Yvly5l02SwVdWTHXwd80FDeox8+OlzVqN5IkMncZWmjtHro/bVD5HgU08K2PASkMKrRqkYti1dgIfmY2WBr6PKcKL/rXZSXwpH7BZA2FufRFZPGzzBXw1f+1k3bQlSyocv0p0jXelS/4sWN6gZQJlqhz9jcBhoRNvrW4oVQvfDIktUkSo18DuE6fxrtNR97AZZF9+xbi6fjf+kMv08uhFFkPE/dkmNBKsncbMGQ/gg==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3395.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d6dd9d2-ec53-44c5-6830-08db15679cca
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2023 06:31:35.9070
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5T3/l9nMO06T+jj69gYZeywTqRH9sF+6CVDui3E/a62++ejT6f9cIWoA8Zb+ZbEjBIERBxNUSPUR5jOkj57Zvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5098
X-Proofpoint-GUID: iaKsGnMMlObR4gBUE-CTi-jGs7qkkAbl
X-Proofpoint-ORIG-GUID: iaKsGnMMlObR4gBUE-CTi-jGs7qkkAbl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-23_02,2023-02-22_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302230055
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Palak,


>On 2/23/2023 12:51 AM, Palak SHAH wrote:
>From: Palak SHAH <palak.shah@raritan.com>
>Sent: Thursday, February 23, 2023 12:51 AM
>To: Minas Harutyunyan <hminas@synopsys.com>; Maynard CABIENTE
><maynard.cabiente@raritan.com>
>Cc: linux-usb@vger.kernel.org
>Subject: RE: usb: gadget: dwc2: not getting audio data
>
>Hi Minas,
>I applied the patch you sent and I have attached the logs. Around 197 secs=
,
>there is a gap of 8 seconds and jumps to 205 secs.
>
>[  197.618605] dwc2 ffb40000.usb: dwc2_gadget_read_ep_interrupts [
>197.618628] dwc2 ffb40000.usb: dwc2_hsotg_epint: ep1(out) DxEPINT=3D0x0000=
0001
>[  197.618652] dwc2 ffb40000.usb: dwc2_hsotg_epint: XferCompl:
>DxEPCTL=3D0x800480c8, DXEPTSIZ=3D0ec10070 [  197.618668] dwc2 ffb40000.usb=
:
>dwc2_hsotg_epint: calling dwc2_gadget_complete_isoc_request_ddma
>[  197.618680] dwc2 ffb40000.usb: dwc2_gadget_complete_isoc_request_ddma:
>calling dwc2_hsotg_complete_request() [  197.618705] dwc2 ffb40000.usb:
>dwc2_hsotg_complete_request, complete: ep 47138ecf ep1out, req 516c0b0e, 0
>=3D> db2182cd [  197.618730] dwc2 ffb40000.usb: dwc2_hsotg_ep_queue, ep1ou=
t:
>req 516c0b0e: req len(200)@req buf(68be9ea5), # of int=3D0, req zero=3D0,
>snok(short not ok)=3D0 [  197.618743] dwc2 ffb40000.usb: dwc2_hsotg_ep_que=
ue,
>EP #(ep1out) Handle DDMA isochronous transfers separately.
>[  197.618752] dwc2 ffb40000.usb: ENTERING dwc2_gadget_fill_isoc_desc [
>197.618763] dwc2 ffb40000.usb: dwc2_gadget_fill_isoc_desc: Filling ep 1, d=
ir
>(out) isoc desc # (41) [  197.618786] dwc2 ffb40000.usb:
>dwc2_gadget_complete_isoc_request_ddma: compl_desc # 39 [  197.618807] dwc=
2
>ffb40000.usb: dwc2_hsotg_epint: At the end of the function,
>dwc2_hsotg_epint() [  197.618807]
>
>------ GAP of 8 secs -------------------------------
>
>[  205.262626] dwc2 ffb40000.usb: dwc2_hsotg_irq: daint=3D00020000 [
>205.264633] dwc2 ffb40000.usb: dwc2_hsotg_irq: daint=3D00020000 [  205.264=
642]
>dwc2 ffb40000.usb: dwc2_hsotg_irq, calling dwc2_hsotg_epint 0 [  205.26465=
1]
>dwc2 ffb40000.usb: ENTERING dwc2_hsotg_epint: EP(1) DIRECTION (out) [
>205.264659] dwc2 ffb40000.usb: dwc2_gadget_read_ep_interrupts [  205.26466=
9]
>dwc2 ffb40000.usb: dwc2_hsotg_epint: ep1(out) DxEPINT=3D0x00000010 [
>205.264678] dwc2 ffb40000.usb: dwc2_hsotg_epint, calling
>dwc2_gadget_handle_out_token_ep_disabled
>[  205.264687] dwc2 ffb40000.usb: dwc2_gadget_handle_out_token_ep_disabled=
:
>target_frame =3D 0x00002a80 [  205.264695] dwc2 ffb40000.usb: ENTERING
>dwc2_gadget_start_isoc_ddma [  205.264715] dwc2 ffb40000.usb: ENTERING
>dwc2_gadget_fill_isoc_desc [  205.264725] dwc2 ffb40000.usb:
>dwc2_gadget_fill_isoc_desc: Filling ep 1, dir (out) isoc desc # (0) [
>205.264733] dwc2 ffb40000.usb: ENTERING dwc2_gadget_fill_isoc_desc [
>205.264743] dwc2 ffb40000.usb: dwc2_gadget_fill_isoc_desc: Filling ep 1, d=
ir
>(out) isoc desc # (1) [  205.264758] dwc2 ffb40000.usb:
>dwc2_gadget_start_isoc_ddma: GRXSTSR=3D0xfefafe10 DCFG=3D=3D0x008402c0
>DCTL=3D0x00000000 DSTS=3D0x002a8900 DxEPCTL(1)=3D0x800480c8 [  205.264767]=
 dwc2
>ffb40000.usb: dwc2_hsotg_epint: At the end of the function,
>dwc2_hsotg_epint()
>

According log in dwc2_gadget_start_isoc_ddma() EP successfully enabled:
DxEPCTL(1)=3D0x800480c8, but looks like GRXSTSR=3D0xfefafe10 contain garbag=
e,
more probably it's data pattern from ISOC OUT packet.
Could you please send me register dump for follow cases:
1. After driver loading
2. After connecting to host, but not start any play audio
3. After issue seen (after DXEPINT_OUTTKNEPDIS interrupts started)

Thanks,
Minas

