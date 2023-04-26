Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CD0E36EEBB8
	for <lists+linux-usb@lfdr.de>; Wed, 26 Apr 2023 02:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239072AbjDZAuQ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Apr 2023 20:50:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239069AbjDZAuC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Apr 2023 20:50:02 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 129AB121
        for <linux-usb@vger.kernel.org>; Tue, 25 Apr 2023 17:49:59 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33Q0gvft002533;
        Tue, 25 Apr 2023 17:49:55 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=b4lZ8+EaSw935WYoKuFwbbHJw5Y/N53vYVSU60PDnNc=;
 b=dvJ8B7soXWEmycNZ8fyTKeCYrTfFLyXJ87mL4Mr2RGMuS1/LTcmtIhygUeWh2IICg+XH
 qB8jjyv9YzjBuAb5tCLOGtDA7aW8nW3VQh+uQ2svxfXWl56m89GRPpYi/288gM4jHHff
 /k3cVrh9SMihPpKRPdbuPa9MPz4m5rasvd/XXkDLt9Ft1ZTmMfWddYsa6SNMgqWc1odh
 1ydm4K2bbW6Zj0yNjL2NBE9ZwNlgDJXlWyerrDM7MtCeiXLa1HaUD/wWWjUfkQD8/GRU
 MS5DO0ZRfFq5SsEGdlKNw7lojNv8fVJIE7o2cAulpj7ccxW9rYPGxnKIhLv8AOQmE37s lQ== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3q4yqpdgv1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 25 Apr 2023 17:49:54 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1682470193; bh=b4lZ8+EaSw935WYoKuFwbbHJw5Y/N53vYVSU60PDnNc=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=Qa2e1Axwqk3GUPitxN80AhYSQi7ibraxO9fOVwsJZ7K+3kdHLqoXkaTwXNmMpW/A1
         Jm10+VVKtEMJQIRCBETdJMPQWMmhk/2Un7vjuJU15DTV9wjov1OFpa9EFosa7cTEeY
         4A/4V1SQSVix3mLnZcyW2k6TYq56W7LZXff7iN0I3fhgILKntdwv3DJNCmJ7O63xee
         Wn5stL+b0/AMxgZvQ2Eh4Mp8lO5DkIXHclcpQqPYZV9K5IrRyN29BZ89yRllNGja0V
         vJltPkQMyWlAEeoILR+wF2VhANDaRWMIIyZo737qruMMsrfdVHgtnJIkxIdvd3wIS/
         jmX5ZPSDiqQAw==
Received: from mailhost.synopsys.com (sv1-mailhost2.synopsys.com [10.205.2.132])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits)
         client-signature RSA-PSS (2048 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 3725A404D0;
        Wed, 26 Apr 2023 00:49:52 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay3.synopsys.com [10.4.161.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 55DDEA0070;
        Wed, 26 Apr 2023 00:49:52 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=I/awlVaQ;
        dkim-atps=neutral
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2172.outbound.protection.outlook.com [104.47.59.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 8786C40360;
        Wed, 26 Apr 2023 00:49:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dUcsVVATgSo3ztMNwDrH8mtSY4NnTd1TzPMx2ozWzR0E6K63TkWbtbM8llq9ZXB6lkamtvxdZtspK7EXqnG7mge1UOZz6t1QNXA5U/xX10guhCxa9r80oCMFxVR14gDQtH495QOVbc+P5wF/6ob59aIAcSVJORbAYzqWQwcF43dzHLsp33gggEqPJEEzkmWT5wDAuJK2CqB39bP5b8zA2n15eg2qwlYWVaouhx7ANg33ZguF1N+AQ2RDPSeuw2WGiBMR5SJdI5t81/5t8KpxIbfUuX5q+b/OxfZ1iVU8cte06JQTyDzbpWN2lyBJhgwOWNcI/TMwajRakk92zCG7ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b4lZ8+EaSw935WYoKuFwbbHJw5Y/N53vYVSU60PDnNc=;
 b=OUnUM4GD9WviBlgoFZcRtLWoeRZ2I7RUVWEPJdaBOyJWCDp0ab8vCKhNCj/FvswhWg7f+63+vrfeQJZlxV5WzqEOdZz3XCqsUUeLx6Jp1YvCOwyzQnLHI3WmAbXXgi4cGkyCb6PCsCRP3cMNUXXNiPn/hbC56EDZVYMzayG8f1GYh6cgQGWreLBZm2hTm71C+o32YkPt27cTixgmyUhz6a6S7xFc9PfrtrKW/muSNOi4P1ZPKsdI5k/UtsoKMWDDqqGPTu7rsM06Ek65f9ANTAj18xQCDdTlq7VF1AEnSZuX5nKsw3pWEqol2DBKt7XdnBnTWCGrrytvU1Pw42Sidg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b4lZ8+EaSw935WYoKuFwbbHJw5Y/N53vYVSU60PDnNc=;
 b=I/awlVaQgkzn4vuk1/tBGz3UBbqqYEMW7XbcVAzYp+5W3r6Ejx82PSU1XAIeqtIiLVwxuT4rnm9g/jHU02Pt2DtDcjX4voxkft8E0OFeOFpqKpw0z5hagsynaVLdP/BtoNNnOT8qOG6J1hCHIagqHIwOfVya7AoqICqyLxjD+6g=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM4PR12MB7694.namprd12.prod.outlook.com (2603:10b6:8:102::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Wed, 26 Apr
 2023 00:49:45 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3103:ba85:b667:315d%7]) with mapi id 15.20.6319.034; Wed, 26 Apr 2023
 00:49:45 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v3] usb: dwc3: update link state on each device level
 interrupt
Thread-Topic: [PATCH v3] usb: dwc3: update link state on each device level
 interrupt
Thread-Index: AQHZdA+28pmFb13CXU68IQyyegnyPa87BwsAgABY6gCAAWnmgA==
Date:   Wed, 26 Apr 2023 00:49:45 +0000
Message-ID: <20230426004943.k24elpf3syplwrqd@synopsys.com>
References: <1682053861-21737-1-git-send-email-quic_linyyuan@quicinc.com>
 <20230424215612.vcji26wau4f3plse@synopsys.com>
 <cac35063-a80a-f039-5bee-331bdef364b9@quicinc.com>
In-Reply-To: <cac35063-a80a-f039-5bee-331bdef364b9@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM4PR12MB7694:EE_
x-ms-office365-filtering-correlation-id: 8e6941da-c40e-4b1e-e0ae-08db45f0216b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e8hzrAYDo/uNyGD7l2H3sxv3ORfZyqBqTGpy83BlZyy/tWhN113udsH1FATP+oGqQKBRN8mCoOJhQi/BKDIM6Z+WqV/gF4FXSmDnaFXrnxqUwp4eF7L4oCiCZGxi0hz9h9LqxaOG+MEvpX4PPmax7B41jNpUddETsiWdBx5zbz7Z4i4QwwTVCudDcO+dxy1YyiE9uwcra1ihuG1z+lAh0RBDPxEPwoDNBHCquMV0y3y5cmWSWwes/E5USfnUCD770QHVVhRQDm52T/DNq2A1fm6UhnJoiiBFsKyClMtQ6waz+YHDUkji6jc2VdMpTFVZUs4DA24oHbZAzt5lukNguPzucFbDvLnzL63n/Ch0ii8ptZUPf1VqEBqd32EFpXzS67bvaKfWvutVvt3qw3vjNnG48xvLGQHl1I0ym6qtwezr32mZALLRbIF2sI4AJWa/vXkvxnEdXjiGXRj7Y5Rl0YwpPl5en7UPwO4bTkuI11fQM82pbAKJhhypxjLjyEeGjkO4Ua9CsfaMI4Zdiyh6vsL/myUiKPO6uq/ftG1nuP8dIFSPcVl0q5oWZoaDYTZi0otHrZe7R+CmP8GcePRSrIRIMkCj1gg6lF23/HylwS3m23mVly1FJWv4vusdWFIF2zyeHwqjJfaLBl5jMWCtGA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(136003)(396003)(39860400002)(451199021)(8676002)(66556008)(66446008)(66476007)(54906003)(64756008)(8936002)(66946007)(76116006)(38100700002)(122000001)(6916009)(15650500001)(478600001)(86362001)(41300700001)(2906002)(316002)(4326008)(5660300002)(71200400001)(6486002)(38070700005)(53546011)(966005)(26005)(6506007)(1076003)(6512007)(186003)(2616005)(83380400001)(36756003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RXJ2bS8yTXRPZTk1MzRyUloxTTZOMEQ4a3lhYkM1Zlhhcjl1cm1xZ2ZoelZC?=
 =?utf-8?B?N3hqVlNvYmplLy9lVFVWZk94OEdWc0hXd1dsRzdWWVorY2JOWFJka1VzV3BS?=
 =?utf-8?B?aERhSkdURDNYKzRuNDhtT0xQeEFLOW0rMVBkQW9UUTdRRTQ0Wm95Nlp3Yitr?=
 =?utf-8?B?TEdldjBLcURjMXhSREIwdTdMV2dSMmFMekt0TzVSbVJOS3VaMHllVUlQZDZK?=
 =?utf-8?B?K2JkZUhLZXRsdDBjTHAzdm40M1VCZlRLOFM2L2tUNHAwWnFISXkyaEVlMHUx?=
 =?utf-8?B?TWY1akNHWWJLeUNJYmVZTjRKT2cxa1ZqaThQK1ZZL2pMc0VuUEttbmN0cmJD?=
 =?utf-8?B?RUFIR3ZIc2pyc2M5dWpTNWZaS2c2QXRybks0ZWJnYVJFNDNHU0FsSzNuRklW?=
 =?utf-8?B?aHIvY0RVdzE5eGlaRXVsWFFpVjV6TldUNENOWDYxK2J1YXQ5WkRGVEswVVVu?=
 =?utf-8?B?b0dYLzJraEJpVzJzRk1BRWRJaXhQa05tbUlHTW5NQXNnVGFBVElFdmpCVkZ3?=
 =?utf-8?B?S2orUHJJTzFJNmhFSlZwbmdUaE96K0VoQ0xkckRidXd6ODVsRng5R0VIa0lt?=
 =?utf-8?B?WFlsaG9XV25JSjdoWGJGNGlDSk1jOXhqYmdNaUIxY1F3dFlldVdaK0VvOUp1?=
 =?utf-8?B?RTg1K1ZEcGlackcybDdQTE9jbDlIYlljMWFyTk5RSHRkOHVhcExZU3FzSWx3?=
 =?utf-8?B?dDB1ZWNJSWRPS2E0ZlU3VlkvaENHamdWT2U1L1lNREJBZFJLQysyOXR4ZkFK?=
 =?utf-8?B?OEhEL3pJNE90VzBPWnpFYUJLdDArZFFDTUJjNGs5RndMT1B0dVR4YWhRcU96?=
 =?utf-8?B?bVl3ZmJrQkFDYUlGQUdSaW9TcldSelZkc0pqczFmVGlYSmx5U2N3TTlBQ2N2?=
 =?utf-8?B?MUxmQWlNRTkyVXRFckZZOFhxUlpidkdjM1Rpc2dPaTdNQXBHTlMrYXNlM1RI?=
 =?utf-8?B?cG5TVkNZc3lvYkZ1V21aWTdtcURaa3Q0QUNOT1RqRXhVTUMxbnIwWWlMTXFp?=
 =?utf-8?B?MDdxcjJFdnNxYzJRcVZDUDJmQ0VmYjdOS0xjWlJERUpRWk9qQXBFdXQ3S3Bo?=
 =?utf-8?B?bnNXUlU0T2xlRXFBV0tDZTlncVNtSCs0ZUlCVVFGRWVmQ0lGeUlDRjZIbVlo?=
 =?utf-8?B?UmsrU1lIYWwwbHE3dUJvbGg1L3NNN24yNXFrV2ZBYXBLZnVMYTFSNWQycEJz?=
 =?utf-8?B?NC9Ga2IwOHUySFFEcnJSOWNzaFdVL29NbDdWbmlMYmtqL01hR2YzUTgzZ3k3?=
 =?utf-8?B?bzVkTjhZZkRackpyU0hQN1RoTHpMUVJURmkxR3R0WG45ektRM0tuZ2RHSGtO?=
 =?utf-8?B?ZlpUajRQUDlOblhMWDQ3L2xlT2NjV2xFM3kwclBrOWpRVDQvNUhudEs4VDJ5?=
 =?utf-8?B?VXB1M1hpUlhZTDFPVGNzcmN4aDhCVEJWa01ITDQ1RXlCekFqV2l6TWM0eXND?=
 =?utf-8?B?aTBTaEZyRlhMK2IzcmpsblRKWlVkOHJSUHpPUkYvR0RNSG1JaVFlNDVOdkpj?=
 =?utf-8?B?YkZFVForNXVWbVpFSnZqcHRWRFlHVUkwY1BhSXFkeFhZaHhFSEtDUW5NOXJt?=
 =?utf-8?B?SU5LUENYSVI1WkFid1VPd0FRRDUvRHNqVk1UVUMyd010VHF1ZWV0YVV0TG9x?=
 =?utf-8?B?QVJubEhjSTQ3RmgrdWgyOG95YWpxRkFyYjl0UnIvWDBvQXdPWHBIUHgvR2k4?=
 =?utf-8?B?aFBkRW9pT3R4NENPVFR5SnZBMzJnVmFWZVoxbGRXMmVLQTVqK3EyVHl3dFp0?=
 =?utf-8?B?bjUzMVpjV3lZcHkzT2xBOVU1K004b0VQZU9JVXNFUW9RRmhRK2ZLa3dQVjhz?=
 =?utf-8?B?UHRZOHhzdzcyMXJ0aStvLzVMcVIxTXhKSFdONXBrYkRxQm1JbU4zdkxTTmp2?=
 =?utf-8?B?RDA2eFJqeTh1OG1vck9NMEhsMytYUlNMcmZCTTQvMjVnUHZZUVhnMnIvdUxQ?=
 =?utf-8?B?djY1dmprU3gvNC9Pa2lEM2J1RERrMUhSa0NsdnB2OHhoU3U5c3NGOUZvSGhh?=
 =?utf-8?B?MCtMT1c5anVRMEhVQ2lJQ3B1U3o1cldzT0xTYXZXNjI0QzAzQUpMN3VycGx0?=
 =?utf-8?B?YzUwZkF6QmhJanlvUzFjTFBVdkRHd3lJOXBNV0RTNWpOSGxsUHpNQ21CZW1n?=
 =?utf-8?B?aFR4RmZQWmk3N0JKYXBZMWQvL2xxVW8wNUlZZk4xL0lKbjUyNGNUTXM3Q1Y5?=
 =?utf-8?B?UFE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <68BE28E8B812CB4A940BAFE16A6E96DE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 9u+plspB4y5CNfroJuy0sGcqUyMceRUj2j26VmnAnKCsOBgEbx0ZRfmXYudP2FsJhkVzIM+XJ0N/tCU1HFgPyatS3PLaHBHQ7QQu02g/bsbqYpgq7Y+A63J8FBfwIYUrxdNfNRRmZFD26eJcE5QRRo9nYjy8BRoz+ZGRhXkhzjgn3vS9+0uG4kib9D8IJeAXc9pZD3ZqJFfcAwa23TFGL6NtHXmDguUVpcpi45n9wYa9ddA5PdBCjAO8ThgZbvVDMDiQHHVict6+54wbaxG73JEK/0NDY53wewYsy5q72Vr0cWQ+CULkFMP2htJXq1KlmJwyakkAQXm13tPANj7RU87nkiZWP23jyCxiYHUsr9HYM3B/XCGJdK9NmTmIpwbe4N1bbwA51kJl8Y/XO4FB36PTPBkS8arULYFsvillXhVxPpp3yjglAQmbOwNomvfURpVFT53JAEmnQMfrsiitye9dI7TsLwj7mVub044GHDdylVZvH7IowF6EpQWXp+I5ZubvReNOpGiSuBbAY1ZDAlYwx09XLqShyTI5fKW1NByfDeKZQTZ05VX9bh+Ho/PIPT+9joOUh5u76liUND7hiPn0BHk78FTpIqBj6pcHtU+otSg09BJlDok9VWoD8ebWGge0WFz222cNtwkde4fVjwne4nuyM2t08eHbC9zCaLLN0Bttv+e0c2yhjHwyDdcWWurW0TeQV8nfzBEIxfGHPfYjMhPddVDE6f4OGqV07cMqLJZZTiSd7JlSNVhnDk1uFQc4y2gkHpEfk5NOihCFQnV8sL4Ctwi9Elyg1uekozBVSqPb+R5fIFpNMekTRLcU41lqjOk+iprIkEhXGj68aBq9IuejIj8UmM4IaPwQVhI9ump/JkP66WhL1TA2/Prr3LYHBdkaOI9a15t21xCcOQ==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e6941da-c40e-4b1e-e0ae-08db45f0216b
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2023 00:49:45.7977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GQaz6C7RFDE7PZSzRXWEGb1Fxni+Rj2wpPZfJMtmDSYhnr9u6u9z5V5VVbFLDgKq7+nGFOvp9ECIGa7gJ5gB0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7694
X-Proofpoint-GUID: RYOkO7OwXqOyiONLWnvNMbJXKKQzTZmo
X-Proofpoint-ORIG-GUID: RYOkO7OwXqOyiONLWnvNMbJXKKQzTZmo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-25_11,2023-04-25_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 adultscore=0 priorityscore=1501 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304260005
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBBcHIgMjUsIDIwMjMsIExpbnl1IFl1YW4gd3JvdGU6DQo+IA0KPiBPbiA0LzI1LzIw
MjMgNTo1NiBBTSwgVGhpbmggTmd1eWVuIHdyb3RlOg0KPiA+IE9uIEZyaSwgQXByIDIxLCAyMDIz
LCBMaW55dSBZdWFuIHdyb3RlOg0KPiA+ID4gV2hlbiB3b3JrIGluIGdhZGdldCBtb2RlLCBjdXJy
ZW50bHkgZHJpdmVyIGRvZXNuJ3QgdXBkYXRlIHNvZnR3YXJlIGxldmVsDQo+ID4gPiBsaW5rX3N0
YXRlIGNvcnJlY3RseSBhcyBsaW5rIHN0YXRlIGNoYW5nZSBldmVudCBpcyBub3QgZW5hYmxlZCBm
b3IgbW9zdA0KPiA+ID4gZGV2aWNlcywgaW4gZnVuY3Rpb24gZHdjM19nYWRnZXRfc3VzcGVuZF9p
bnRlcnJ1cHQoKSwgaXQgd2lsbCBvbmx5IHBhc3MNCj4gPiA+IHN1c3BlbmQgZXZlbnQgdG8gVURD
IGNvcmUgd2hlbiBzb2Z0d2FyZSBsZXZlbCBsaW5rIHN0YXRlIGNoYW5nZXMsIHNvIHdoZW4NCj4g
PiA+IGludGVycnVwdCBnZW5lcmF0ZWQgaW4gc2VxdWVuY2VzIG9mIHN1c3BlbmQgLT4gcmVzZXQg
LT4gY29ubmRvbmUgLT4NCj4gPiA+IHN1c3BlbmQsIGxpbmsgc3RhdGUgaXMgbm90IHVwZGF0ZWQg
ZHVyaW5nIHJlc2V0IGFuZCBjb25uZG9uZSwgc28gc2Vjb25kDQo+ID4gPiBzdXNwZW5kIGludGVy
cnVwdCBldmVudCB3aWxsIG5vdCBwYXNzIHRvIFVEQyBjb3JlLg0KPiA+ID4gDQo+ID4gPiBBcyBp
biBnYWRnZXQgbW9kZSwgZGV2aWNlIGxldmVsIGludGVycnVwdCBldmVudCBoYXZlIGxpbmsgc3Rh
dGUNCj4gPiA+IGluZm9ybWF0aW9uLCBsZXQncyB0cnVzdCBpdCBhbmQgdXBkYXRlIHNvZnR3YXJl
IGxldmVsIGxpbmsgc3RhdGUgdG8gaXQNCj4gPiA+IHdoZW4gcHJvY2VzcyBlYWNoIGRldmljZSBs
ZXZlbCBpbnRlcnJ1cHQuDQo+ID4gPiANCj4gPiA+IFNpZ25lZC1vZmYtYnk6IExpbnl1IFl1YW4g
PHF1aWNfbGlueXl1YW5AcXVpY2luYy5jb20+DQo+ID4gPiAtLS0NCj4gPiA+IHYzOiAocmVmZXIg
djIgaHR0cHM6Ly91cmxkZWZlbnNlLmNvbS92My9fX2h0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXVzYi8xNjgyMDQyNDcyLTIxMjIyLTEtZ2l0LXNlbmQtZW1haWwtcXVpY19saW55eXVhbkBx
dWljaW5jLmNvbS9fXzshIUE0RjJSOUdfcGchWkhhczlMV1p1ODFyVTZ4a2dNZHBDQmVqSGtSMDV1
VEJTTkZ1N3pXRkZkZ1hfbl8tUkFRN3Z1dUNWQWRJNUlOMTdJaEdocmlYSVAySDN5LUZiaGszVlRf
UUUtaFE5USQgKQ0KPiA+ID4gbm8gY29kZSBjaGFuZ2Ugc2luY2UgdjIsIGNoYW5nZXMgY29tcGFy
ZSB2MSBhcyBiZWxvdywNCj4gPiA+IDEpIGFkZCBhIGZsYWcgc3VzcGVuZF9pcnFfaGFwcGVuIHRv
IHNpbXBsaWZ5IGR3YzNfZ2FkZ2V0X3N1c3BlbmRfaW50ZXJydXB0KCksDQo+ID4gPiAgICAgaXQg
d2lsbCBhdm9pZCByZWZlciB0byBzb2Z0d2FyZSBsZXZlbCBsaW5rX3N0YXRlLCBmaW5hbGx5IGxp
bmtfc3RhdGUgd2lsbA0KPiA+ID4gICAgIG9ubHkgdXNlZCBpbiBkd2MzX2dhZGdldF9saW5rc3Rz
X2NoYW5nZV9pbnRlcnJ1cHQoKS4NCj4gPiA+IDIpIHJlbW92ZSBzdyBzZXR0aW5nIG9mIGxpbmtf
c3RhdGUgaW4gZHdjM19nYWRnZXRfZnVuY193YWtldXAoKQ0KPiA+ID4gMykgYWRkIGR3YzNfZ2Fk
Z2V0X2ludGVycnVwdF9lYXJseSgpIHRvIGNvcnJlY3Qgc2V0dGluZyBvZiBsaW5rX3N0YXRlDQo+
ID4gPiAgICAgYW5kIHN1c3BlbmRfaXJxX2hhcHBlbi4NCj4gPiA+IA0KPiA+ID4gdjI6IHVwZGF0
ZSBhY2NvcmRpbmcgdjEgZGlzY3Vzc2lvbg0KPiA+ID4gdjE6IGh0dHBzOi8vdXJsZGVmZW5zZS5j
b20vdjMvX19odHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC11c2IvMTY3NTIyMTI4Ni0yMzgz
My0xLWdpdC1zZW5kLWVtYWlsLXF1aWNfbGlueXl1YW5AcXVpY2luYy5jb20vX187ISFBNEYyUjlH
X3BnIVpIYXM5TFdadTgxclU2eGtnTWRwQ0JlakhrUjA1dVRCU05GdTd6V0ZGZGdYX25fLVJBUTd2
dXVDVkFkSTVJTjE3SWhHaHJpWElQMkgzeS1GYmhrM1ZUOTVPRzBSbUEkDQo+ID4gPiANCj4gPiA+
ICAgZHJpdmVycy91c2IvZHdjMy9jb3JlLmggICB8ICAxICsNCj4gPiA+ICAgZHJpdmVycy91c2Iv
ZHdjMy9nYWRnZXQuYyB8IDQwICsrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0t
LS0NCj4gPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkNCj4gPiA+IA0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvY29yZS5o
IGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gPiA+IGluZGV4IGQ1NjQ1N2MuLjg2MjJmOWMg
MTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuaA0KPiA+ID4gKysrIGIv
ZHJpdmVycy91c2IvZHdjMy9jb3JlLmgNCj4gPiA+IEBAIC0xMzMyLDYgKzEzMzIsNyBAQCBzdHJ1
Y3QgZHdjMyB7DQo+ID4gPiAgIAl1bnNpZ25lZAkJZGlzX3NwbGl0X3F1aXJrOjE7DQo+ID4gPiAg
IAl1bnNpZ25lZAkJYXN5bmNfY2FsbGJhY2tzOjE7DQo+ID4gPiAgIAl1bnNpZ25lZAkJd2FrZXVw
X2NvbmZpZ3VyZWQ6MTsNCj4gPiA+ICsJdW5zaWduZWQJCXN1c3BlbmRfaXJxX2hhcHBlbjoxOw0K
PiA+IENhbiB3ZSByZW5hbWUgdGhpcyB0byBzdXNwZW5kZWQuIEFsc28sIHBsZWFzZSBkb2N1bWVu
dCBuZXcgc3RydWN0DQo+ID4gbWVtYmVyLg0KPiANCj4gDQo+IGkgZG9uJ3Qga25vdyBpZiBpdCBp
cyBnb29kIHRvIG5hbWUgc3VzcGVuZGVkLMKgIGFzIHRoZXJlIGFyZSBzb21lIHBvd2VyDQo+IG1h
bmFnZW1lbnQNCj4gDQo+IHN0YXRlIGxpa2UgcnVudGltZSBzdXNwZW5kLg0KDQpUaGlzIGlzIGlu
IHRoZSBjb250ZXh0IG9mIGR3YzMgZXZlbnQsIGl0IHNob3VsZCBiZSBmaW5lLg0KDQo+IA0KPiAN
Cj4gPiA+ICAgCXUxNgkJCWltb2RfaW50ZXJ2YWw7DQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy91c2IvZHdjMy9nYWRnZXQuYyBiL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMNCj4gPiA+IGlu
ZGV4IDlmNDkyYzguLjIzOWNmYzEgMTAwNjQ0DQo+ID4gPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2Mz
L2dhZGdldC5jDQo+ID4gPiArKysgYi9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ID4gPiBA
QCAtMjQyMiw3ICsyNDIyLDYgQEAgc3RhdGljIGludCBkd2MzX2dhZGdldF9mdW5jX3dha2V1cChz
dHJ1Y3QgdXNiX2dhZGdldCAqZywgaW50IGludGZfaWQpDQo+ID4gPiAgIAkJCXJldHVybiAtRUlO
VkFMOw0KPiA+ID4gICAJCX0NCj4gPiA+ICAgCQlkd2MzX3Jlc3VtZV9nYWRnZXQoZHdjKTsNCj4g
PiA+IC0JCWR3Yy0+bGlua19zdGF0ZSA9IERXQzNfTElOS19TVEFURV9VMDsNCj4gPiA+ICAgCX0N
Cj4gPiA+ICAgCXJldCA9IGR3YzNfc2VuZF9nYWRnZXRfZ2VuZXJpY19jb21tYW5kKGR3YywgRFdD
M19ER0NNRF9ERVZfTk9USUZJQ0FUSU9OLA0KPiA+ID4gQEAgLTQxNzgsNyArNDE3Nyw3IEBAIHN0
YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X2Nvbm5kb25lX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdj
KQ0KPiA+ID4gICAJICovDQo+ID4gPiAgIH0NCj4gPiA+IC1zdGF0aWMgdm9pZCBkd2MzX2dhZGdl
dF93YWtldXBfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MsIHVuc2lnbmVkIGludCBldnRpbmZv
KQ0KPiA+ID4gK3N0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X3dha2V1cF9pbnRlcnJ1cHQoc3RydWN0
IGR3YzMgKmR3YykNCj4gPiA+ICAgew0KPiA+ID4gICAJLyoNCj4gPiA+ICAgCSAqIFRPRE8gdGFr
ZSBjb3JlIG91dCBvZiBsb3cgcG93ZXIgbW9kZSB3aGVuIHRoYXQncw0KPiA+ID4gQEAgLTQxOTAs
OCArNDE4OSw2IEBAIHN0YXRpYyB2b2lkIGR3YzNfZ2FkZ2V0X3dha2V1cF9pbnRlcnJ1cHQoc3Ry
dWN0IGR3YzMgKmR3YywgdW5zaWduZWQgaW50IGV2dGluZm8pDQo+ID4gPiAgIAkJZHdjLT5nYWRn
ZXRfZHJpdmVyLT5yZXN1bWUoZHdjLT5nYWRnZXQpOw0KPiA+ID4gICAJCXNwaW5fbG9jaygmZHdj
LT5sb2NrKTsNCj4gPiA+ICAgCX0NCj4gPiA+IC0NCj4gPiA+IC0JZHdjLT5saW5rX3N0YXRlID0g
ZXZ0aW5mbyAmIERXQzNfTElOS19TVEFURV9NQVNLOw0KPiA+ID4gICB9DQo+ID4gPiAgIHN0YXRp
YyB2b2lkIGR3YzNfZ2FkZ2V0X2xpbmtzdHNfY2hhbmdlX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAq
ZHdjLA0KPiA+ID4gQEAgLTQyOTgsMjAgKzQyOTUsMzkgQEAgc3RhdGljIHZvaWQgZHdjM19nYWRn
ZXRfbGlua3N0c19jaGFuZ2VfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MsDQo+ID4gPiAgIAlk
d2MtPmxpbmtfc3RhdGUgPSBuZXh0Ow0KPiA+ID4gICB9DQo+ID4gPiAtc3RhdGljIHZvaWQgZHdj
M19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YywNCj4gPiA+IC0JCQkJ
CSAgdW5zaWduZWQgaW50IGV2dGluZm8pDQo+ID4gPiArc3RhdGljIHZvaWQgZHdjM19nYWRnZXRf
c3VzcGVuZF9pbnRlcnJ1cHQoc3RydWN0IGR3YzMgKmR3YykNCj4gPiA+ICAgew0KPiA+ID4gLQll
bnVtIGR3YzNfbGlua19zdGF0ZSBuZXh0ID0gZXZ0aW5mbyAmIERXQzNfTElOS19TVEFURV9NQVNL
Ow0KPiA+ID4gLQ0KPiA+ID4gLQlpZiAoZHdjLT5saW5rX3N0YXRlICE9IG5leHQgJiYgbmV4dCA9
PSBEV0MzX0xJTktfU1RBVEVfVTMpDQo+ID4gPiArCWlmICghZHdjLT5zdXNwZW5kX2lycV9oYXBw
ZW4gJiYgZHdjLT5saW5rX3N0YXRlID09IERXQzNfTElOS19TVEFURV9VMykgew0KPiA+IERvIHdl
IHN0aWxsIG5lZWQgdG8gY2hlY2sgZm9yIGR3Yy0+bGlua19zdGF0ZSBpZiB3ZSB1c2UNCj4gPiBz
dXNwZW5kX2lycV9oYXBwZW4gZmxhZz8NCj4gDQo+IA0KPiBzdXJlLCBJIHdpbGwgcmVtb3ZlIGl0
IGFuZCBqdXN0IHRydXN0IHN1c3BlbmQgaXJxLg0KPiANCj4gDQo+ID4gDQo+ID4gPiArCQlkd2Mt
PnN1c3BlbmRfaXJxX2hhcHBlbiA9IHRydWU7DQo+ID4gPiAgIAkJZHdjM19zdXNwZW5kX2dhZGdl
dChkd2MpOw0KPiA+ID4gKwl9DQo+ID4gPiArfQ0KPiA+ID4gLQlkd2MtPmxpbmtfc3RhdGUgPSBu
ZXh0Ow0KPiA+ID4gK3N0YXRpYyBpbmxpbmUgdm9pZCBkd2MzX2dhZGdldF9pbnRlcnJ1cHRfZWFy
bHkoc3RydWN0IGR3YzMgKmR3YywNCj4gPiA+ICsJCQljb25zdCBzdHJ1Y3QgZHdjM19ldmVudF9k
ZXZ0ICpldmVudCkNCj4gPiA+ICt7DQo+ID4gPiArCXN3aXRjaCAoZXZlbnQtPnR5cGUpIHsNCj4g
PiA+ICsJY2FzZSBEV0MzX0RFVklDRV9FVkVOVF9MSU5LX1NUQVRVU19DSEFOR0U6DQo+ID4gPiAr
CQlicmVhazsNCj4gPiA+ICsJZGVmYXVsdDoNCj4gPiA+ICsJCWR3Yy0+bGlua19zdGF0ZSA9IGV2
ZW50LT5ldmVudF9pbmZvICYgRFdDM19MSU5LX1NUQVRFX01BU0s7DQo+ID4gPiArCQlicmVhazsN
Cj4gPiA+ICsJfQ0KPiA+ID4gKw0KPiA+ID4gKwlzd2l0Y2ggKGV2ZW50LT50eXBlKSB7DQo+ID4g
PiArCWNhc2UgRFdDM19ERVZJQ0VfRVZFTlRfU1VTUEVORDoNCj4gPiA+ICsJCWJyZWFrOw0KPiA+
ID4gKwlkZWZhdWx0Og0KPiA+ID4gKwkJZHdjLT5zdXNwZW5kX2lycV9oYXBwZW4gPSBmYWxzZTsN
Cj4gPiA+ICsJCWJyZWFrOw0KPiA+ID4gKwl9DQo+ID4gV2h5IDIgc3dpdGNoZXMgdG8gdGhlIHNh
bWUgZXZlbnQtPnR5cGUgaGVyZT8gVGhpcyBsb2dpYyBpcyBjb25mdXNpbmcuDQo+IA0KPiANCj4g
Y2hhbmdlIHRvIHR3byBpZiAvIGVsc2UgP8KgIHdlIG5lZWQgdG8gaGFuZGxlIGFsbHMgc2V0dGlu
ZyBvbmUgZnVuY3Rpb24sDQo+IA0KPiBpIGRvbid0IHdhbnQgdG8gYWRkIHR3byBmdW5jdGlvbnMg
aGVyZS4NCj4gDQoNCk15IHBvaW50IGlzIHRoYXQgaXQgZG9lc24ndCBtYWtlIHNlbnNlIHRvIHNw
bGl0IHRoZSBzd2l0Y2goKSB3aXRoIGENCnNpbmdsZSBjYXNlIGZvciBlYWNoIHRvIHRoZSBzYW1l
IGV2ZW50LT50eXBlLiBJdCdzIGRpZmZpY3VsdCB0byBmb2xsb3cNCnRoYXQgbG9naWMuDQoNCj4g
DQo+ID4gDQo+ID4gPiAgIH0NCj4gPiA+ICAgc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfaW50ZXJy
dXB0KHN0cnVjdCBkd2MzICpkd2MsDQo+ID4gPiAgIAkJY29uc3Qgc3RydWN0IGR3YzNfZXZlbnRf
ZGV2dCAqZXZlbnQpDQo+ID4gPiAgIHsNCj4gPiA+ICsJZHdjM19nYWRnZXRfaW50ZXJydXB0X2Vh
cmx5KGR3YywgZXZlbnQpOw0KPiA+IFRoaXMgaXMgbm90IHdoYXQgd2UgZGlzY3Vzc2VkLiBQcmV2
aW91c2x5IEkgc3VnZ2VzdGVkIHRvIGxlYXZlIHRoZQ0KPiA+IGR3Yy0+bGlua19zdGF0ZSBmb3Ig
dGhlIHF1aXJrICh1c2JfZHdjMyByZXZpc2lvbiA8Mi41MGEpIGFuZCBub3QgdXNlIGl0DQo+ID4g
Zm9yIG90aGVyIHNjZW5hcmlvcy4gVGhlIGR3Yy0+bGlua19zdGF0ZSB3YXMgdXNlZCBhcyB0aGUg
X3ByZXZpb3VzXw0KPiA+IGNhcHR1cmVkIHN0YXRlLCBhbmQgbm90IHRoZSBjdXJyZW50IGNhcHR1
cmVkIGxpbmtfc3RhdGUuIE5vdywgeW91DQo+ID4gY2hhbmdlZCBpdCB0byB0aGUgY3VycmVudCBs
aW5rX3N0YXRlIG9mIGFuIGV2ZW50LiBCZWNhdXNlIHRoaXMgb2xkIHZzDQo+ID4gbmV3IGxpbmtf
c3RhdGUgd2FzIGNvbmZ1c2luZyB0aGF0IEkgc3VnZ2VzdGVkIG5vdCB0byB1c2UgaXQgYXQgYWxs
IG91dA0KPiA+IHNpZGUgb2YgdGhlIHF1aXJrIGNvbnRleHQgaXQgd2FzIGluLg0KPiANCj4gDQo+
IHN0aWxsIGNhbid0IGZ1bGx5IHVuZGVyc3RhbmQgeW91ciBpZGVhLg0KPiANCj4gaWYgZm9sbG93
aW5nIHlvdXIgc3VnZ2VzdGlvbizCoCBhbmQgcmVtb3ZlIHVzYWdlIGluDQo+IGR3YzNfZ2FkZ2V0
X3N1c3BlbmRfaW50ZXJydXB0KCksDQo+IA0KPiBsaW5rX3N0YXRlIG9ubHkgdXNlZCBpbiBsaW5r
IHN0YXRlIGNoYW5nZSBpbnRlcnJ1cHQsIHdlIGNhbiBvbmx5IHRoaW5rIGl0DQo+IGhhcyBvbGQg
bGlua19zdGF0ZSBtZWFuaW5nLg0KDQpZb3UncmUgcmV1c2luZyBkd2MtPmxpbmtfc3RhdGUgZm9y
IHNvbWV0aGluZyBvdXRzaWRlIG9mIHRoZSBxdWlyaywgYW5kDQp5b3UgdXBkYXRlIGl0IG91dHNp
ZGUgbGluayBzdGF0ZSBjaGFuZ2UgZXZlbnQuIFRoZSBjb25kaXRpb24gY2hlY2tpbmcNCmZvciB0
aGUgcXVpcmsgbWF5IG5vIGxvbmdlciBiZSB0aGUgc2FtZSBhbnltb3JlLiBUaGlzIGNhbiBjYXVz
ZQ0KcmVncmVzc2lvbi4NCg0KQlIsDQpUaGluaA0KDQo+IA0KPiANCj4gPiANCj4gPiBJIGJlbGll
dmUgaXQncyBzdWZmaWNpZW50IGlmIHdlIGNhbiBqdXN0IHVzZSBhIHRvZ2dsZSBmbGFnICh5b3Vy
DQo+ID4gc3VzcGVuZF9pcnFfaGFwcGVuKSB0byBoYW5kbGUgeW91ciBjYXNlLg0KPiA+IA0KPiA+
IFRoYW5rcywNCj4gPiBUaGluaA0KPiA+IA0KPiA+ID4gKw0KPiA+ID4gICAJc3dpdGNoIChldmVu
dC0+dHlwZSkgew0KPiA+ID4gICAJY2FzZSBEV0MzX0RFVklDRV9FVkVOVF9ESVNDT05ORUNUOg0K
PiA+ID4gICAJCWR3YzNfZ2FkZ2V0X2Rpc2Nvbm5lY3RfaW50ZXJydXB0KGR3Yyk7DQo+ID4gPiBA
QCAtNDMyMyw3ICs0MzM5LDcgQEAgc3RhdGljIHZvaWQgZHdjM19nYWRnZXRfaW50ZXJydXB0KHN0
cnVjdCBkd2MzICpkd2MsDQo+ID4gPiAgIAkJZHdjM19nYWRnZXRfY29ubmRvbmVfaW50ZXJydXB0
KGR3Yyk7DQo+ID4gPiAgIAkJYnJlYWs7DQo+ID4gPiAgIAljYXNlIERXQzNfREVWSUNFX0VWRU5U
X1dBS0VVUDoNCj4gPiA+IC0JCWR3YzNfZ2FkZ2V0X3dha2V1cF9pbnRlcnJ1cHQoZHdjLCBldmVu
dC0+ZXZlbnRfaW5mbyk7DQo+ID4gPiArCQlkd2MzX2dhZGdldF93YWtldXBfaW50ZXJydXB0KGR3
Yyk7DQo+ID4gPiAgIAkJYnJlYWs7DQo+ID4gPiAgIAljYXNlIERXQzNfREVWSUNFX0VWRU5UX0hJ
QkVSX1JFUToNCj4gPiA+ICAgCQlkZXZfV0FSTl9PTkNFKGR3Yy0+ZGV2LCB0cnVlLCAidW5leHBl
Y3RlZCBoaWJlcm5hdGlvbiBldmVudFxuIik7DQo+ID4gPiBAQCAtNDMzNCw3ICs0MzUwLDcgQEAg
c3RhdGljIHZvaWQgZHdjM19nYWRnZXRfaW50ZXJydXB0KHN0cnVjdCBkd2MzICpkd2MsDQo+ID4g
PiAgIAljYXNlIERXQzNfREVWSUNFX0VWRU5UX1NVU1BFTkQ6DQo+ID4gPiAgIAkJLyogSXQgY2hh
bmdlZCB0byBiZSBzdXNwZW5kIGV2ZW50IGZvciB2ZXJzaW9uIDIuMzBhIGFuZCBhYm92ZSAqLw0K
PiA+ID4gICAJCWlmICghRFdDM19WRVJfSVNfUFJJT1IoRFdDMywgMjMwQSkpDQo+ID4gPiAtCQkJ
ZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1cHQoZHdjLCBldmVudC0+ZXZlbnRfaW5mbyk7DQo+
ID4gPiArCQkJZHdjM19nYWRnZXRfc3VzcGVuZF9pbnRlcnJ1cHQoZHdjKTsNCj4gPiA+ICAgCQli
cmVhazsNCj4gPiA+ICAgCWNhc2UgRFdDM19ERVZJQ0VfRVZFTlRfU09GOg0KPiA+ID4gICAJY2Fz
ZSBEV0MzX0RFVklDRV9FVkVOVF9FUlJBVElDX0VSUk9SOg0KPiA+ID4gLS0gDQo+ID4gPiAyLjcu
NA==
