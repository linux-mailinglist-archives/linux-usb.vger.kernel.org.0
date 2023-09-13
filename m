Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E827B79DD42
	for <lists+linux-usb@lfdr.de>; Wed, 13 Sep 2023 02:53:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233051AbjIMAxN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 20:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229890AbjIMAxM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 20:53:12 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C077010F6
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 17:53:08 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38CKhQFS018482;
        Tue, 12 Sep 2023 17:52:23 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pfptdkimsnps;
 bh=/xcgJzWxCu0YV3+WLjTcfrEkXArxh7UG4BQt+O8C6E8=;
 b=cQGWdlz4bZb4yV7a1OREiO4TB240P+UuHwPyj4GD0TvvMZx1VVn/Udcj5guKlayza0WU
 Qc4ucqa2ObbfT5NzHuzeQ0V2pJEoyq98IPl/xblLN8dRjk+/TAgC1z++pLCEaR+INrRO
 UuPn+SptyWQ6uYEVuc2uB4Gtl98EPJ61gkwYgrKxdAf//C3HzoRAF32DzrS0K+qoHhC3
 mEmEDWicCSL7cPFhdMCr3H2zHAgB1yJgqodgNbraKvGnUzAQxjreMxq102P895eWgqLS
 YtWE6ExSDX+r+Buyh9MULJEKn3ngqjVcrvY5dlYPiovB8zreeNJ6adxrvUa+ovTc7haG bw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3t2y9aruk9-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 12 Sep 2023 17:52:22 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1694566342; bh=GATS8lZvTEYQusNORsg9GKthXqEBkMBV2IDOflBo0xY=;
        h=From:To:CC:Subject:Date:From;
        b=MrKJsXniia0MGd/N8CbB0mObUl2P+wyU0jN7FJj6Y2c4/YX0SpesF4Yx1GKOV2Mb8
         EGJYOeVjFTPLFRvgtC0DOg4XetaPKzDooZ9K58p4LhMN3NVEjPhzGHAr54ExJ+vzXi
         vOG6z6pY49NxJ4rnVdqiNqxSWW9LchH9zb8JbGZy7cyjo4CLimajhr0Xiw3M6RBLZI
         ZB7fSJaLx9WXOjWffnktHGV7LuwE8WM3p6bu76Ep03sldauoyLO4R9mrM59SnKL41o
         2wolZUSMMhUbAhpJ1AwnD8MEILphMY0CHW/55H+kExxr2E1WuvXp7zJ2sgdmiBiuGS
         Uo1h9aOyBWlFA==
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 0700D4035C;
        Wed, 13 Sep 2023 00:52:21 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 0C09BA0068;
        Wed, 13 Sep 2023 00:52:20 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=MARJXX1b;
        dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2102.outbound.protection.outlook.com [104.47.58.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id A021E40147;
        Wed, 13 Sep 2023 00:52:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nbvtuiavJeVdJEo6UuEdeSlh0L5b207kryYmtpY0qwUzuOYhMwF+7PSH0FHX5jSRXFHD20V85YPoOx1LFYacjSX6w4ilSzHn/3Ha0UAFZwmsXYVTdF9DPFYD0Fme7IsiqF8ghDpSEpUX4FO3VwEPwAt08n7aHx/fve1kj7E8QPnGeY0eroiSw9OJbfQoJ6PtLgAEzWSQPlknr39SZCxwRpMdfoQ16IKq3AbQEkQFrp9wl9Gl349U5qBAcmVpQ8dDWujWMsWlazK3CTRgbmzLDnpOd/QSA4dMxui3kEU8igFCrNDo2Uoyp9lr3kApcBBGN2STYd2LUoxBRbgVCOtpJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xcgJzWxCu0YV3+WLjTcfrEkXArxh7UG4BQt+O8C6E8=;
 b=ZZb7h+N7W217JtB6hwzXZOUAIbncLGh0H/IsGgrTPYnrxvOw6AreESc3xl/wK/S77qnbkuQVmY8asq767WTl9WlkyBGZlCQ8zWEmdOxKDfg3cIGXWWfE+kpRRk99nHI318WIrcqlJeBTfjT0HfNUsYp9V9G4oGM0RkcPTFGER8fdOId04ulZI6maMSUj8dTYvgqj/CPf5eBSNam1tBEaCYcOQQ2rQUUMApO0Z6ZnRczacsntsuoI2/4o9K6Kfkeq7eebaFPtlRnGqyxtuvjWpq/BXXbtcMj+YEbEQtjH/mHK4ggBAuqIG2gnbp9Ih7o9qeGL4Ax6C8zLWD1c92iSaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xcgJzWxCu0YV3+WLjTcfrEkXArxh7UG4BQt+O8C6E8=;
 b=MARJXX1bPEbLD+QrgUtDsRScG6PEPQNMrbM9qAKeArbIQWFY+GR0tngTJ2bmTlXvK72bzWIpbzDpaRKY1ZDJpEMlPeQZeATPpmLuZO5s86EQ3FTSaO3nn8sxNWe36TH78V5KoU4Zb1wfimLUrtw8snM/1DOJ4SLYXM0kVkUequs=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DS0PR12MB8442.namprd12.prod.outlook.com (2603:10b6:8:125::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.35; Wed, 13 Sep
 2023 00:52:16 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::548c:ae3:537f:ca2f%5]) with mapi id 15.20.6792.019; Wed, 13 Sep 2023
 00:52:16 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Jisheng Zhang <jszhang@kernel.org>,
        Kenta Sato <tosainu.maple@gmail.com>
CC:     John Youn <John.Youn@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        stable <stable@kernel.org>, Manu Gautam <mgautam@codeaurora.org>,
        Roger Quadros <rogerq@ti.com>
Subject: [PATCH] usb: dwc3: Soft reset phy on probe for host
Thread-Topic: [PATCH] usb: dwc3: Soft reset phy on probe for host
Thread-Index: AQHZ5dyKoaCEdJ+w5UO4Jaesr32Vrw==
Date:   Wed, 13 Sep 2023 00:52:15 +0000
Message-ID: <70aea513215d273669152696cc02b20ddcdb6f1a.1694564261.git.Thinh.Nguyen@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DS0PR12MB8442:EE_
x-ms-office365-filtering-correlation-id: a8c33d38-ff80-401f-1d1b-08dbb3f3acd4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pQeKc4KExkJXYxg4LEAUEKfVOR1RFw1JtbqnntXoSvmMolJqeGeK7F6gEGdJoIxZE62GEurPsE9oh+T1w+oEYyrT9nblUS41NNRvMHsQRnqwAH1s28LBUjZjRhVcomtdcDsU3QBHjUe0hbx7bVyO8XquoR7SeL0mNxD0lhulfcPqOhn6WCMdiGbld/2nk4/NixK/pprPlzmq4LworWaQuDgasvgF5qpcj89a5jppSKfXUoYm5n5wgQeVv8xaNNY40i61Rad4VD/yiJd5yEr8dc/ZgPeI5fQRSlbqHsI0mR6UNLPmLOE2PtqtZuztO9mo6x5U5hvO+cyQtDv8XIQ3zkhGeuVKURreEhaP6KgQrKSHYTcENtcM18MtYQiqpMhs2XaLnmO6bSKdW9mioJ1LTpYdUv2seiz+D5Hc0+FCzmlHXJviBN7h97VT7nOsDuyU9QMJBOV5nk+7Q65U8mqQsujUi2Oi4CFagig1WBY4ulifyfbDFa4Z7cGuvdHYy7j3OVc8YboOkhf1pj+6RpA3KcD0NIQQ9sOIKgfnK7fSGS9JA0QsPDhtCxfEbKdhze1gdqwa/vgyM4oBMWCQbnQCE1fivjM3r672Qrql1VPng58=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(366004)(136003)(396003)(1800799009)(186009)(451199024)(76116006)(110136005)(86362001)(83380400001)(2906002)(2616005)(71200400001)(6506007)(6512007)(122000001)(38100700002)(6486002)(966005)(26005)(38070700005)(36756003)(478600001)(5660300002)(54906003)(8676002)(66476007)(66556008)(316002)(66446008)(64756008)(4326008)(8936002)(66946007)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gIpifNO4oX36Kwk4nFErVaf6pVEBxL/S+XS74Rkql1yG3wdM6+S5jK8n/s?=
 =?iso-8859-1?Q?v+N9K4aP5tri6XLGkAH9xyXZhNwm34sWiFo6YDyBzieqXNaCRPPJL93EyF?=
 =?iso-8859-1?Q?S5DJk67YeCCx4ps6cdcmOxFV+9zvkLOwjx3wy5ws13KdEeWXl44rM9E1lu?=
 =?iso-8859-1?Q?VLrG80ARc2hfVfdjDT/4Wtahx8urPzhxTagcW7QT8GyYZ2gP3zhIx6ASti?=
 =?iso-8859-1?Q?Ub6bljCdInSHq1Dp5al7yaATQMMUPd4gtvhK6P0EX1Lklnug5Ql1RavDZt?=
 =?iso-8859-1?Q?Bl4S7BOO+yD2dTEsxp0kVLbeNAN/xwjGtjRan5Le3GcLp+gPIJ9O+B7K2Z?=
 =?iso-8859-1?Q?vc72UbXgfIfdgw11rMVNpLOrA9rStDx2inuxhAzeqTU5QUDqsyq8QUJznY?=
 =?iso-8859-1?Q?Vi5uBGuGPVLLLPB4yzyz98ErgfvzGN6CnodMvMgnzQGCH+CVI1uohHrQN+?=
 =?iso-8859-1?Q?RC0PYMBDtNHMrjGGUFubnLuXHx8yz77DONeBVLn7DmXUXg49q1Ytjjal0m?=
 =?iso-8859-1?Q?JUHiVqlhAUl+1UVNUmX91iRmOSr80jopug/oJten5+666CfeuDZjhJw/rt?=
 =?iso-8859-1?Q?IMwTYhc7kPkHkO4LDq0V5WzL1Pnf+y5IgrdiBvgwbzHIy++P9dWmTlqV2A?=
 =?iso-8859-1?Q?JsUFG5TkC27K3M5mrrBooaiJG26/GYaQz5SjSonIYPivlgnuYnmj6uBQis?=
 =?iso-8859-1?Q?xvByUXm93wElebGuQQBa5rHksiDhKg3bHhHjuBsHlcjReBCcFWAQ0kE0Xs?=
 =?iso-8859-1?Q?rJxKhzzhXQ1nG+GTIj/KYAdiEC6cb2kcrBWZtGXIlk56nAARU7NnYYQd0e?=
 =?iso-8859-1?Q?kb8xXXcIPGQ41M6UhhPvzFjHiOZbGbZdXKUgDgSRRKP8JO/sFmWiLArJMw?=
 =?iso-8859-1?Q?E97b9QhYkWP86AUKVPlNJ9mTVkh+aE5S8BIIQWGVZelH7scpBFH+VAGDMy?=
 =?iso-8859-1?Q?ci2+LeRQY3TkoRFkPOSux+49+bSPdKdZXezME0MJWihVFM+IrEJhg40JPl?=
 =?iso-8859-1?Q?pUAW2zjEhiVClBv5cAnjinEhjPAMoy03JcJcqNC8u10C9ndYR83OX19sGD?=
 =?iso-8859-1?Q?O4RH2HE2JXOeqDCK4BmVvzhJBkC7FIp704wywk3bPoGOTnCRWi5bHvIkOe?=
 =?iso-8859-1?Q?HI5q/vAq5QRDLkCBHNIjKFPPT5Bi+qhioFxHh8tCXr4DYwTWa7I3D6Cnky?=
 =?iso-8859-1?Q?b5C/XCIWsqD+pV2iGv905+LcY1fwZ+j+f1n3eHvRihud5C0LRQFQDLQ5j1?=
 =?iso-8859-1?Q?k9Eq5YDreyePnRb/KUEyVm25P7uJ1Fs+tNIG0WVXzRWrnamtmiJZdd4NBi?=
 =?iso-8859-1?Q?QgitINr7zpeWKyrQLDIQJiVEX7PCXrK+xv0HeK7P9jYeb4IugPQXVKoJ2t?=
 =?iso-8859-1?Q?lLc00A70UNU3RPqbnGCNaT7wGqcRT4hdkyqG8+w4TloO09iAbEv5sQlXzt?=
 =?iso-8859-1?Q?T2eP2LjL+cigpubpYEQ2W4EionR3ia+x5vvV8mfNiWbpBNUng6E8fhPiR+?=
 =?iso-8859-1?Q?b189schmbpbGLn/y1MQIA1ANGxTRxGutHq4nkmAnECTjsAvhjrek6r1mOQ?=
 =?iso-8859-1?Q?DA0oGSzYOdHaybeXXHJoxrgRwchqN39FoGGZ5BO1S4KhE9mYwV9spZB2lU?=
 =?iso-8859-1?Q?/RvguQ/2CBq8z1g2FA9lXemdpNHi6wgZ4Y?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?iso-8859-1?Q?SHvPPPmVQysrWLf41+NDXy1jjdanLltH+9XU7FrykZkKrQqXmsMOFKu1G9?=
 =?iso-8859-1?Q?Ao624VmAy7dwuUpT4JBUNlr9qOePdnt0Hz61Wq4b2b/nSEaqYze5zz1SKG?=
 =?iso-8859-1?Q?wSt9UiwfWZhKaO/6SUAhgX5T32F6waHyd7CPwlaZZixwejTUhzVeZwJSwW?=
 =?iso-8859-1?Q?y4vqN+SN6VhIn8Y+dJIlovF8RKpQKxjrBpvvvfaBqvFXZ5KcaR9i51b0pS?=
 =?iso-8859-1?Q?7eqJMiXfI07SuBerFUhGdFDHI98p/vyw3CSxM9Eyehg6LFolMfcRO7Nr5l?=
 =?iso-8859-1?Q?y/0d2KYEKqX0YrriPow7nQbDrZGvqn4JpOB9KHFExsCdOa8ttTQVg3KoMs?=
 =?iso-8859-1?Q?Bj6+8vRUp9f5QJfPzY92ovSatqA8JyLje7nvLOYQYigv+xDjKc+GMcKGMG?=
 =?iso-8859-1?Q?MWjZQkgyMT48jR8V0gNIX1HsZcs6N/m6tWbw1AMAbMhuFrmUgPZImkF2rO?=
 =?iso-8859-1?Q?4l85tZxEOkbci0PxzXlKfJf/aeJGXh6CCVwiHYSP8XFOwjtM/Sv8YMy9bB?=
 =?iso-8859-1?Q?kVNAeBKw+UDlJRF3To1ANajkqqKl9IhgQv6/1BX5hRMKwxYmtkflGMe+22?=
 =?iso-8859-1?Q?nTgU/8+RZCOcgzBwGlp2NxND/WxSlsJChQMlChj47ZimZ1M54J6ZIqbqAd?=
 =?iso-8859-1?Q?lbHcXrJ04nrhJmV+p/RbHYx4XTAoDr3jIkANTsSyeWirQ40ewbnCSUbd1U?=
 =?iso-8859-1?Q?dDPUBIMSe8BSVPeIwe4ZtdwBai79MT0bLQ4lVCBzDkiDU1BlfDjBMVtLK4?=
 =?iso-8859-1?Q?pXnxhDnAB7hiWY7H0QIR6Cd/rKKAstjJoQoLNrqSAyDtalFbsez4Eke77h?=
 =?iso-8859-1?Q?A88H+mxaTaCPc1u+kjPo5+zA6+7loJWnOZeBpz3Us4lJ9tkSuT4tTydCvJ?=
 =?iso-8859-1?Q?HfF7ChW86WHT5UWqmAW7l+Sp4IuYc6rqoTL2ITU55hA0maK++beJAFA/8A?=
 =?iso-8859-1?Q?zFF/H4Rb+C6Mpvbwt2WzcAb1JtZ6zCoww7z7JzB+uqaiflXjQmYAaCEvtN?=
 =?iso-8859-1?Q?BbjUZo2pfvMsaEUSY=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c33d38-ff80-401f-1d1b-08dbb3f3acd4
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2023 00:52:16.0537
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: we2EfFcwS6Dzk9+uTtCVTk1WH3kAn8X4/qFgR2EmEoPDc71D8GsxSsiuO3yDd4rTpPXFZMlMIpLhRLnsi1UMJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8442
X-Proofpoint-ORIG-GUID: 0ajaDAsQ2kcZItysxg63xrOb_WAMj6Z8
X-Proofpoint-GUID: 0ajaDAsQ2kcZItysxg63xrOb_WAMj6Z8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309130005
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

When there's phy initialization, we need to initiate a soft-reset
sequence. That's done through USBCMD.HCRST in the xHCI driver and its
initialization, However, the dwc3 driver may modify core configs before
the soft-reset. This may result in some connection instability. So,
ensure the phy is ready before the controller updates the GCTL.PRTCAPDIR
or other settings by issuing phy soft-reset.

Note that some host-mode configurations may not expose device registers
to initiate the controller soft-reset (via DCTL.CoreSftRst). So we reset
through GUSB3PIPECTL and GUSB2PHYCFG instead.

Cc: stable@vger.kernel.org
Fixes: e835c0a4e23c ("usb: dwc3: don't reset device side if dwc3 was config=
ured as host-only")
Reported-by: Kenta Sato <tosainu.maple@gmail.com>
Closes: https://lore.kernel.org/linux-usb/ZPUciRLUcjDywMVS@debian.me/
Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
---
 drivers/usb/dwc3/core.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
index 9c6bf054f15d..343d2570189f 100644
--- a/drivers/usb/dwc3/core.c
+++ b/drivers/usb/dwc3/core.c
@@ -279,9 +279,46 @@ int dwc3_core_soft_reset(struct dwc3 *dwc)
 	 * XHCI driver will reset the host block. If dwc3 was configured for
 	 * host-only mode or current role is host, then we can return early.
 	 */
-	if (dwc->dr_mode =3D=3D USB_DR_MODE_HOST || dwc->current_dr_role =3D=3D D=
WC3_GCTL_PRTCAP_HOST)
+	if (dwc->current_dr_role =3D=3D DWC3_GCTL_PRTCAP_HOST)
 		return 0;
=20
+	/*
+	 * If the dr_mode is host and the dwc->current_dr_role is not the
+	 * corresponding DWC3_GCTL_PRTCAP_HOST, then the dwc3_core_init_mode
+	 * isn't executed yet. Ensure the phy is ready before the controller
+	 * updates the GCTL.PRTCAPDIR or other settings by soft-resetting
+	 * the phy.
+	 *
+	 * Note: GUSB3PIPECTL[n] and GUSB2PHYCFG[n] are port settings where n
+	 * is port index. If this is a multiport host, then we need to reset
+	 * all active ports.
+	 */
+	if (dwc->dr_mode =3D=3D USB_DR_MODE_HOST) {
+		u32 usb3_port;
+		u32 usb2_port;
+
+		usb3_port =3D dwc3_readl(dwc->regs, DWC3_GUSB3PIPECTL(0));
+		usb3_port |=3D DWC3_GUSB3PIPECTL_PHYSOFTRST;
+		dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(0), usb3_port);
+
+		usb2_port =3D dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
+		usb2_port |=3D DWC3_GUSB2PHYCFG_PHYSOFTRST;
+		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), usb2_port);
+
+		/* Small delay for phy reset assertion */
+		usleep_range(1000, 2000);
+
+		usb3_port &=3D ~DWC3_GUSB3PIPECTL_PHYSOFTRST;
+		dwc3_writel(dwc->regs, DWC3_GUSB3PIPECTL(0), usb3_port);
+
+		usb2_port &=3D ~DWC3_GUSB2PHYCFG_PHYSOFTRST;
+		dwc3_writel(dwc->regs, DWC3_GUSB2PHYCFG(0), usb2_port);
+
+		/* Wait for clock synchronization */
+		msleep(50);
+		return 0;
+	}
+
 	reg =3D dwc3_readl(dwc->regs, DWC3_DCTL);
 	reg |=3D DWC3_DCTL_CSFTRST;
 	reg &=3D ~DWC3_DCTL_RUN_STOP;

base-commit: 0bb80ecc33a8fb5a682236443c1e740d5c917d1d
--=20
2.38.1
