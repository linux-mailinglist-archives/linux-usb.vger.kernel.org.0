Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C91A86DB817
	for <lists+linux-usb@lfdr.de>; Sat,  8 Apr 2023 04:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229532AbjDHCI7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 7 Apr 2023 22:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjDHCI6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 7 Apr 2023 22:08:58 -0400
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D690E06C
        for <linux-usb@vger.kernel.org>; Fri,  7 Apr 2023 19:08:57 -0700 (PDT)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3380Iq1C001201;
        Fri, 7 Apr 2023 19:08:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=aIHktrY4JrY12kwUjCanr+J0jcoqv3oDICUmEbNLsiM=;
 b=AQywqk7tg3uLfQVHVRfHc7vyMnryhktYuwGzuSNrTekLqe7yEgZg/jbEafRm4i8OvXya
 dEqv44SvmcIu2cdbnY6Sdvvob6KM8JBlKji2csNS9WY/1Ulj/ROgEYLQoz4hnUu5xViY
 5hEc+1pGANV0ecFZvDZLgqTJBtSijqQCUF2cD34TtHWB+fVv4qzE3HsyzjcuH5ANhxU/
 xFwUAGJG4UY3LgHHgInvtDwP/knREqdt65b8lHHbp8rOu/HffuK8AKmwsWiU4CSCttzN
 6HY29GCLb6uMRBsma1hJK/DVkf+0tdRrFH4suPEyl0AjN64jtWVm2JicecCtOZMDfD2C Vw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3ppkv9m7m5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 07 Apr 2023 19:08:52 -0700
Received: from mailhost.synopsys.com (sv1-mailhost1.synopsys.com [10.205.2.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 047F4C04C0;
        Sat,  8 Apr 2023 02:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1680919732; bh=aIHktrY4JrY12kwUjCanr+J0jcoqv3oDICUmEbNLsiM=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=JY7cQKiuAn8aCtx3qPqIgvnOymcccfIUEe1vWpCln+i0ZPQZhVMuH8XbgHPW0yT7i
         UlRniRwjGe4Hx6GL1mpEye3sM8crfFRFww4HWbqp3jPF3oBCWdYno6NNLuttAeB6CI
         5GA/0TK+JaCnWLrqAnXM/9qfhZJV8B5sr1Eb43rIrHQqvq1TCXc+jpZ45py8/IhU6y
         0O1b6zQkSb1ACem4l/ykBGuXZSl0QVrTSoWYPcsMQ7heqJuqU/hTIB37iVfbzHZ8/6
         hDGm2WiYVQzB5Un3kuUUDXCyCdIdg2eZ5CYVb+fgD2OyYbEYyN/J3ewhUeipyWqvaP
         kyU1ZCg6nhnpQ==
Received: from o365relay-in.synopsys.com (sv2-o365relay1.synopsys.com [10.202.1.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 7802DA0064;
        Sat,  8 Apr 2023 02:08:51 +0000 (UTC)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2168.outbound.protection.outlook.com [104.47.59.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 51C3440074;
        Sat,  8 Apr 2023 02:08:51 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="N9N6Fw1+";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MdcDfwmWvniRqBggIxpPmbvuYZ/KRfQlbd0JlR08jOKxblxp1RTeTrptWgvXZIbhSclrjVH9+qnFehz2Ck1x+4/eUUt/M7gncM3tPvlhdejQOuCzHeeKDfSDLDTJLekmNh3uykHIzmH/geehbOF+ipJv6ioEqs6G04JtG0zg/AHMI7dEQrxeZFixFKevIIkIsPC6PKZ63MhCty1y/eLB1indRLJ0X3bRr4DQVzNU3k0thVsX0r1uYl3kRxM+i7LtoW1maV8OJHBywNEWlo/GXMS2KpnGTZmE9lRILqoCnRXXjOSc2rMaknSu4RhsJVNsl22ZO5qPSe/yZejPl2HVtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aIHktrY4JrY12kwUjCanr+J0jcoqv3oDICUmEbNLsiM=;
 b=Tuw5BrPnp4+us2e7DUVs/aHg+zN5kGwBCDoNnVimDONrk0w+uybFcJSNr2gcoKv7OmQLKIaGb/EcQUDjicTRXvccjgXZHRbsQcP3Iz7giECbsb8Ugi4iUPiU0LjlWgbF/D4uG7I9vrwGsab1ucf9rB+2lNDIRIAWnl9cfaTxaVsPM31hdyt421Y1l74WSDoUffoB23G1SjUOHrcJrf+v/6Q2Ao+Th29fEhYKK5bB+JSxHQX5yTGtPxzT34Ynn/kzZrgPSbKIi33sU9tepxPMQyrgr9r9k8A65AWy4au+H94eNkbpG2Pd/JE6X2Ho/2CAJlKIRQRsS0/XY0/ujjmtVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aIHktrY4JrY12kwUjCanr+J0jcoqv3oDICUmEbNLsiM=;
 b=N9N6Fw1+ZTR+KF2CNVcHv0txymHU+xzXRFqvyuFh7rInXZVLOfo8lkOiaT55LMlbSFOuEN1BqsOQ021KK9i48Fcax+HYYrFkYwMvu0BypcpxkfgqbkN8oik3z20gTyEvxQ4Uo+AMn4WHsfP7bhPTREX92z1sjnhcvFtXAlU86/0=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by SA1PR12MB7127.namprd12.prod.outlook.com (2603:10b6:806:29e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.35; Sat, 8 Apr
 2023 02:08:47 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c22b:eb27:6df3:8d25]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::c22b:eb27:6df3:8d25%4]) with mapi id 15.20.6277.034; Sat, 8 Apr 2023
 02:08:47 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Stanley Chang <stanley_chang@realtek.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v1 1/2] usb: dwc3: core: add support for remapping global
 register start address
Thread-Topic: [PATCH v1 1/2] usb: dwc3: core: add support for remapping global
 register start address
Thread-Index: AQHZaRcy64Ak1IW6YkuqLSHQPwUUKK8gq+QA
Date:   Sat, 8 Apr 2023 02:08:47 +0000
Message-ID: <20230408020840.344xuicuqb4abtow@synopsys.com>
References: <20230407060703.19469-1-stanley_chang@realtek.com>
In-Reply-To: <20230407060703.19469-1-stanley_chang@realtek.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|SA1PR12MB7127:EE_
x-ms-office365-filtering-correlation-id: 0ae8d4dc-fc93-4e39-2dc7-08db37d6300f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: z4bBKoGTpT+kRL73cXzXiBL4QBBreZQimUxK2XwYPTTxb5ulR2RW2wUXUf0ZKNTk3GdiQKszyMNym2TjnUgRKiBaehffaiAi80HXd86wMyRCDY/Se2PNYGB4A1HXq24S3TvXb/OgngsGny5adOhGYdrcOdNxnArm9qnKSXoVEIHF0bcZaI7w+AkwKKq74EmlayVJJHSBwOBmNo09LuvFq/JXo5cK10zPjH+LHK5sGu/3+Do7qnziQFVKocBSL/vywxu7C0qDD8W6jIQeE85cHxuFOO4q2YX1l5swErNuBYjtspClr6vCOTmtgy/huIzAgTj+9/2qD/u90Q1OiGGLhCx7Q9AbtdFP5pspZUzjv/7VpDBXqVjliIt3LFKPCPMRtMrlzHD/gjjQjqvoyfqPKs49MSBlzU19b9dE2Gh/Jh7PgLn7QDjX50bJggFXdcQpka8W8j5bEOGrSmzbI0f1c8XZ0VbPRLVpSbm3/WVfoh2wsMngns7MoH1R3K+9Vyode2TYoZ1btjvkzxZsNj6i55qvzmb6vhzSpKrEtghrAxgE5eE5nxrZehJ5wPkaxuuQj6f94lxEbbmYzIi7r+/TCN/hNXms/Da/33eiuCllepMYkpkKMK4p1yvjQtXaC89w
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(136003)(366004)(346002)(451199021)(6486002)(71200400001)(36756003)(86362001)(38070700005)(2616005)(38100700002)(83380400001)(1076003)(6512007)(122000001)(6506007)(26005)(2906002)(8676002)(4326008)(54906003)(41300700001)(316002)(8936002)(76116006)(5660300002)(6916009)(66556008)(66446008)(66476007)(66946007)(186003)(64756008)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MTJWYjgrdm1oalE4UDhBSlhUUC9QdmtteFpkNVZyb3FoZDU0UXlTcWp4Mmls?=
 =?utf-8?B?amMvZ1Bnb3oyMFVyREhYcEdJK1ZRMXBPbS9Xdk1sMWFmTWtUME04TGJMUHgy?=
 =?utf-8?B?SmZ6Y1hjSnRoVGk0aDNUcnZXMFVJeXEwSWd3Ylp6ZGlhYUhSYW1GUGFnMTEx?=
 =?utf-8?B?cENEWUp2cHJUVUIzUmNpS0dhdlpxSko5Sm5hUDRjcDRsRzRqRUxtbVIrZ1hX?=
 =?utf-8?B?clN1QlFzVWR3cmhENm9yeTdWaFZSdUl4S05sYnJSUmZTMENMYllUVk51MHh6?=
 =?utf-8?B?OVoreTJTbmF2dXAwZW9GL2RRQjhhb250MnJBdmROR1ZoUDAyL2Z1bzloOXVi?=
 =?utf-8?B?MllHUzRBdWg5M09MU3VOY2J1R1NaNXl4b2RLN1NFOEd0OE1yVjZsVUdWbnZP?=
 =?utf-8?B?eTRSMXJtaWN4T0JTTUhMZEk4c0h3bXd2TXE2RjR0WlRiUjZHa2EwS1pnQlRU?=
 =?utf-8?B?NExiRzVkWDBIdGt6WGtRUGJpdkY3ZnZHSWtOc0R5RFUrK3c3QWk4dVJaQlg5?=
 =?utf-8?B?dmtTVzVjZzJCZUt0UmppalVoZktZQWVrSjZwd05FV2FYM01ac2JKODV6T1Fv?=
 =?utf-8?B?OTk3ckxmQUt1ekZkQk5kYlo0NmVRU1IrL1ZxQXFWcGZXaVNzalcranFUNzkw?=
 =?utf-8?B?UzVhODZ3MTNraWYzWlQ1NWhwQ3A5enZnb2FveHRpK0xreUFZMzdVTHlUTlJP?=
 =?utf-8?B?dWgrVGI5dkY5dHI2cVd1NFFXWE84TDlNOUlLUTlCaHBibVArWkRmTkExWWxM?=
 =?utf-8?B?V2xlanJaanplZXNicm9yUkVIT1pqNlB4SW5pOEpuNS8yWGNGOW1UQldtZEN0?=
 =?utf-8?B?YVU3cXJFbU9uVjhGZVpKUGpNdGt5R0lnbW1SNW9xNmNEMTdSbE5JM1RUOVN5?=
 =?utf-8?B?a29naUNFRGlLcmZQZmY5a1BNakYxS3N2Q3RGM0R6a1Y5cU9xQlNoSXBCcFdl?=
 =?utf-8?B?dTYwQjdTc0tIQUhMQ3hoRmZRUWU5WEJIWm9TTTk2VmM2MS8rYUx3cW0vVlFu?=
 =?utf-8?B?SUNsbkZsUTRWblhrS2crNzd3Mjl1Y3NTdGIxZ29DaEZFbDlyM0Q0L2dxWkFO?=
 =?utf-8?B?RjhwMHcvOGFVVDB2eDJMVHBmNElKQ2YyMHg4cnVIc2VZdXdWREFyc3A0QXU5?=
 =?utf-8?B?SndidThNTDhRaksrRk9jZzhTVXNrM1lhWFBmWlJ2RnFZQmhFam9CZlU5UEhO?=
 =?utf-8?B?QjVDQTZ1YjlJb1FiYnBTamJrM1pNZ3B2eWQrS3kzL0FWNXl0N003c0QrdlhV?=
 =?utf-8?B?WWZNS2RpTTBvZ0VZMVBydzVaQ0ptc2dBMHhVK1JaNisvenlwWXl2ZG1tcUVW?=
 =?utf-8?B?SzU5aFZVNGs5aU9sWFEwc2FYR2NDa2RSUlcyRTZWenczclV0eURuWUluR0h4?=
 =?utf-8?B?NmVRK0dwaVJjYkphVUlpMnN5WnhFSHFucnNEU3BzV0FpQmVSWTZ4VkV4WERJ?=
 =?utf-8?B?eVd0dXg5dEp0ZS9ZbXRpR1gzRGtFRGJkazAvZVRjelpoemN6aFFKbSttZ2I4?=
 =?utf-8?B?Vkl6anpaNXZHNWVpcmtyTkExUHY2eG8zWjVJTE5oeDloM3YwRzk1QVRoU1Av?=
 =?utf-8?B?dTZGQWYzWkRySnFIMDJkNVJVLzBENm9IQWlCN2N5cGZvMDhpNnFEL1c1R08w?=
 =?utf-8?B?ZEFsZW5lOVdScHRSV3kvdU84TUVKMUdpOUtxUWFDNFkvdTM5NjZVeStWanV0?=
 =?utf-8?B?dDNITnNQaGtsWEFwQW9tUldnaVpicmRXaklYOVJZU0VZRzhTQXUzL0cwUVNp?=
 =?utf-8?B?ZGRaS0NRZ0kzMjFvOU5JSjEwb0k1ODMwUnk0MTdPRmk5bkNFMFhxUi9jUFpI?=
 =?utf-8?B?Y21SZVl4YzNtd2hwRXhsakNUaUo5YTdGQW1NcE43MDJuSTVuTVFaZ1g4SU1F?=
 =?utf-8?B?Nis5SktWZzlISGFQcTNIVWJSUkF2OEhqM1hkUEdSbU5nMmR5dnNNWEtNUGIv?=
 =?utf-8?B?aVpwYllIa0I3bXlSekpOUi9pVDJvcmZCMFMvTThyNFFWVVd5Y3NpeEhiR1E5?=
 =?utf-8?B?Sm0wN21jcDdMaXpPdlEwWGxWS1llTUZSYzhPTzB5alRBVGNVTUtJMWhqRHBB?=
 =?utf-8?B?RFFDeDZVK0FWcmpodFJ2Zm1yTWhkOGNrdWkyU0c4OHNEbnBLb2JwQnJsSlNq?=
 =?utf-8?Q?Nboiutbl26OKegppE6HTamqkd?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E3FA8F1EA3DF94BA7FC150AC838A12F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: u50uaBlw2PO9Y0k8HTAWJKRLckn7qHlylWMZV560NqmUjVsc6zqz1+tRJXbUs59vuENpIcmd+bAIc3VTk91p07HYoRmLcepGs3hmgyRkYf+Md52VkGgzBP00I0DLeUfQ3CQd7zjzFFVEAb7Oia4WHOC7z03P4vDkPqdYLGwydj2dD5RSDLZgv8ddTZFTxJjoaE094pgDJweXaWf+w32UCGPgSh+1Eqkg1BwCn8pjCCALH9iRGS5mXUDbQ2a+U+NcCcXa9ExrmQe0UloMzUrRmgieaLjX7x/V05JbLwy2iU0uilO1I61BfNMH0SEme7tGvSeCzC2yDmH1HC2pXUWWzzQicHnBGjN9UJ4CxQFoAc1mSA76UWaQt/H2yLzA+6lB2XV99gptPo+WbnnsqTS/Y1g0GTIaEUVbJ+ZyoUQpuTPMCb3MvyLUzanSmyaWiKBlenlGh7WbzbijUqVVSHEgOVJar+8NepU1y6JZe33f5juxwwruyi9WM3nbMhCLqKeHy6bqyO2XD4VwUDkKFC3HaH+c+h0nyueKr5LX1uv6UqxqVs9EZxLKEpKijZ6avRIM7ASTpnIwErmkD7HpyHyyg7o+ArXoQP73mn5v6Kdvo3xC3xwSrdnz7d4ZhaBfV+F+IrkE8zr+Uaj//wPTRJN4K3aomfMxIu9cE9k8amp3T9rFds+GCf+boNJ/azL4HHZsazEv84I2w8A3ulV8lKC/LJuC5eT8nLrQ8gdzXofP69o3GI7o5pQchZ+xaeHFsDaCj/AmVTzSBQeWhlQQZJGSNyI/Xug0p3PkIBYQq4CM8RbaM+BCu9SnNgaGgREAPMqPR+t/PQ56ubvF9Omkp4PGyA==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ae8d4dc-fc93-4e39-2dc7-08db37d6300f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2023 02:08:47.1392
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rrUKNxrno/Ivm2TyGHoq9BRq6Zr39UEPxI5q5E2ZayAUmakg/kqJQy783S8XRf4p2C8qJgDJzMqz4PDKb+Qr+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7127
X-Proofpoint-ORIG-GUID: 13sw8sDxzM--KAjyJH2t19mmLj1gJ1kl
X-Proofpoint-GUID: 13sw8sDxzM--KAjyJH2t19mmLj1gJ1kl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-07_16,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 suspectscore=0 mlxscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2304080017
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gRnJpLCBBcHIgMDcsIDIwMjMsIFN0YW5sZXkgQ2hhbmcgd3JvdGU6DQo+IFRoZSBSVEsgREhD
IFNvQ3Mgd2VyZSBkZXNpZ25lZCB0aGUgZ2xvYmFsIHJlZ2lzdGVyIGFkZHJlc3Mgb2Zmc2V0IGF0
IDB4ODEwMC4NCj4gVGhlIGRlZmF1bHQgYWRkcmVzcyBpcyBhdCBEV0MzX0dMT0JBTFNfUkVHU19T
VEFSVCAoMHhjMTAwKS4NCj4gVGhlcmVmb3JlLCBhZGQgdGhlIHByb3BlcnR5IG9mIGRldmljZS10
cmVlIHRvIGFkanVzdCB0aGlzIHN0YXJ0IGFkZHJlc3MuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBT
dGFubGV5IENoYW5nIDxzdGFubGV5X2NoYW5nQHJlYWx0ZWsuY29tPg0KPiAtLS0NCj4gIGRyaXZl
cnMvdXNiL2R3YzMvY29yZS5jIHwgMTcgKysrKysrKysrKysrKysrKysNCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxNyBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy91c2IvZHdj
My9jb3JlLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2NvcmUuYw0KPiBpbmRleCA0NzZiNjM2MTg1MTEu
Ljc3MWIzNTQ0OTM3NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4g
KysrIGIvZHJpdmVycy91c2IvZHdjMy9jb3JlLmMNCj4gQEAgLTE3ODUsNiArMTc4NSwyMyBAQCBz
dGF0aWMgaW50IGR3YzNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gIAlk
d2NfcmVzID0gKnJlczsNCj4gIAlkd2NfcmVzLnN0YXJ0ICs9IERXQzNfR0xPQkFMU19SRUdTX1NU
QVJUOw0KPiAgDQo+ICsJLyogRm9yIHNvbWUgZHdjMyBjb250cm9sbGVyLCB0aGUgZHdjMyBnbG9i
YWwgcmVnaXN0ZXIgc3RhcnQgYWRkcmVzcyBpcw0KPiArCSAqIG5vdCBhdCBEV0MzX0dMT0JBTFNf
UkVHU19TVEFSVCAoMHhjMTAwKS4NCj4gKwkgKi8NCg0KUGxlYXNlIHVzZSB0aGlzIGNvbW1lbnQg
c3R5bGUgYmxvY2s6DQogLyoNCiAgKiBhIGIgYw0KICAqIGQgZSBmDQogICovDQoNCj4gKwlpZiAo
ZGV2KSB7DQoNCldoeSBkbyB3ZSBuZWVkIHRoaXMgaWYgKGRldikgY2hlY2s/IFdoZW4gd291bGQg
dGhpcyBub3QgYmUgdGhlIGNhc2U/DQoNCj4gKwkJaW50IGZpeGVkX2R3YzNfZ2xvYmFsc19yZWdz
X3N0YXJ0Ow0KDQpOZWVkIHRvIGluaXRpYWxpemUgdGhpcyBpbiBjYXNlIHlvdSBnZXQgYm9ndXMg
dmFsdWUgd2hlbiB0aGUgcHJvcGVydHkgaXMNCm5vdCBkZWZpbmVkLg0KDQo+ICsNCj4gKwkJZGV2
aWNlX3Byb3BlcnR5X3JlYWRfdTMyKGRldiwgInNucHMsZml4ZWRfZHdjM19nbG9iYWxzX3JlZ3Nf
c3RhcnQiLA0KDQpQcm9wZXJ0eSBuYW1lIHNob3VsZCBiZSB1c2luZyAiLSIgaW5zdGVhZCBvZiAi
XyIuIEFsc28gY2FuIHdlIHJlbmFtZSBpdA0KdG8gInNucHMsZ2xvYmFsLXJlZ3Mtc3RhcnRpbmct
b2Zmc2V0Ig0KDQpUaGFua3MsDQpUaGluaA0KDQo+ICsJCQkJICZmaXhlZF9kd2MzX2dsb2JhbHNf
cmVnc19zdGFydCk7DQo+ICsJCWlmIChmaXhlZF9kd2MzX2dsb2JhbHNfcmVnc19zdGFydCkgew0K
PiArCQkJZHdjX3Jlcy5zdGFydCAtPSBEV0MzX0dMT0JBTFNfUkVHU19TVEFSVDsNCj4gKwkJCWR3
Y19yZXMuc3RhcnQgKz0gZml4ZWRfZHdjM19nbG9iYWxzX3JlZ3Nfc3RhcnQ7DQo+ICsJCQlkZXZf
aW5mbyhkZXYsDQo+ICsJCQkgICAgImZpeGVkIGR3YzMgZ2xvYmFscyByZWdpc3RlciBzdGFydCBh
ZGRyZXNzIGZyb20gMHgleCB0byBlbmQgMHgleFxuIiwNCj4gKwkJCSAgICAoaW50KWR3Y19yZXMu
c3RhcnQsIChpbnQpZHdjX3Jlcy5lbmQpOw0KPiArCQl9DQo+ICsJfQ0KPiArDQo+ICAJcmVncyA9
IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsICZkd2NfcmVzKTsNCj4gIAlpZiAoSVNfRVJSKHJl
Z3MpKQ0KPiAgCQlyZXR1cm4gUFRSX0VSUihyZWdzKTsNCj4gLS0gDQo+IDIuMzQuMQ0KPiA=
