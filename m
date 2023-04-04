Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 198616D6FD3
	for <lists+linux-usb@lfdr.de>; Wed,  5 Apr 2023 00:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236391AbjDDWD3 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Apr 2023 18:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236274AbjDDWD1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Apr 2023 18:03:27 -0400
Received: from mx0b-00230701.pphosted.com (mx0b-00230701.pphosted.com [148.163.158.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 167283C15
        for <linux-usb@vger.kernel.org>; Tue,  4 Apr 2023 15:03:26 -0700 (PDT)
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
        by mx0b-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 334LZSrO024767;
        Tue, 4 Apr 2023 15:03:15 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=wJpZdHk5bYzQmL2zsqFy2lxZnfcQBK63YbfL4/AI60M=;
 b=oKXbJKjy1KbpOrE1UYXCYsFj4dMZJ4ppfTb1WoIYXTTaPeaHTgXh14EzIpZNhgvhvA6O
 OqxV3QRA41Y6ZCPVXz0QAjwk9+5OXo3NAycw4pHqPaMtgB3K8eujH9OBSQrYtFuiLLIh
 5Wlnk7ZOx+00NONIei4dsQhdCz0Noddy0ZSaXtGsHZpbfLpVLNsSdQjloVKSdslKxCje
 BC/J+jxPm8X6qoNgSiQ1py03LSWEL5sIpFM3Li33+5fr/8NQ6PR0K9zxl0RkL9GT7X48
 Zdy8ja7iJAEUijXLA71JN33gnoXk10XJgoVGvhZ/5ikG3enM4H6Awb92TUcnO+F/pDK+ Eg== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 3ppk8jadwb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 04 Apr 2023 15:03:15 -0700
Received: from mailhost.synopsys.com (badc-mailhost3.synopsys.com [10.192.0.81])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F01E9C04C0;
        Tue,  4 Apr 2023 22:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1680645794; bh=wJpZdHk5bYzQmL2zsqFy2lxZnfcQBK63YbfL4/AI60M=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=fL1aJo4onwOKkM9CS0iaw4+ebCGQ0qWH75w8BxykbpX3l71HTCTZ+YxTATrNZeh0q
         Hdjac5VFnq8KKxP75rC3ly2i7VLLjfQab7PhoR68fMgq1aBaQFK9aNfp7+clGfsXUm
         WpsC2iXADW4erZtSgWKGAAKpInNrNHAferd3n7C9/hWEPy/mzs5nxSibVdM9j0bIss
         BJ68KN4J5LVPpgp2E37zvFbMmbOtZYf+1+aR4AB7ntfOp4A9DYqp+qsXs6dIMTB4ph
         2Ar3a0BPp1wbuVbec6vo1HY8O+0vsFkhsfoxPlGKehrSzG3EjCnFfWvQSaxmcD2rcs
         jakXlYgm7Benw==
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com [10.202.1.139])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 2A066A007A;
        Tue,  4 Apr 2023 22:03:13 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2044.outbound.protection.outlook.com [104.47.57.44])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id D41DF4006B;
        Tue,  4 Apr 2023 22:03:12 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="tzU4hIa3";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O8ofavOx+i/J8g3KYAFD1Wv1o/hJq7jmXXqCQ4MGX9ZcVuvjGnjPw3ylCE3IA7DPRpN4YRAyXYKZTxrrwLTnxleVSdKN8BogAZxJyKtfkEp6oz/sunkbncEsYGwRtwbEBAEAkrsiaUH0iD9MwaJNx6emYXs2FF1C7SxRalgCZjnFnvWQE4R2PJtEqA8UStCtxq67RY3eZ4G+73V5HgpgECW9ZH+jFd8W1v5agG25+NxizP96n1wz4WDoHnXEs2jokwDkb39aErl5ixwyUm7DxN4TjN9fAjgmbuWg2Hz+KXkSTGBdzK4iVZYzkkhe0eYTiUhs4W+T/gPAmV4hczrwYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wJpZdHk5bYzQmL2zsqFy2lxZnfcQBK63YbfL4/AI60M=;
 b=NUaGdmkR89Yib3LYxhzTk+a6AfadvnoWcRRJ20WCho6nLQ21/s2M5WCq4WCdheIfTMhLBMKEZ3RKHCreNKmkjqQqgLabgnnIzr71KX7uiHOEX+u2XPrkM5+f+YY0Q99cttw49R4jeycKT4I8ocpb+3LvA5d/JobVkEcsO61ND+8M/lMPswLzt9q/iCvZl7C1qupEm674/Ngh29VQKIpGo5+aBEWUGp47V5iurkqdEpSEz8GLXel5wgk4gipW09YUCM2S8fr87YBMSd95aJON/TWgUjRHA7mM4j7wZWT3M71p/DKbUfIgDrlsiZxWnjPHv8bHFeuZGqbVoKaYnmDpcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wJpZdHk5bYzQmL2zsqFy2lxZnfcQBK63YbfL4/AI60M=;
 b=tzU4hIa3KQRNtG/wDezWkb3jxRMiF/4fL5vqqf0NVNnfUR+Tvp+jmItyU+w6AJp+sThsBOm/GFptu4HNwyJw6cUkhkzn0ZFmT74J9StHUkGuXrbYGcaC1c0vgb4V8ddSRZSnn/HfqrKXONxdiE2tDMaKa8OIM0NG8Thyw3sGg8c=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by DM4PR12MB5938.namprd12.prod.outlook.com (2603:10b6:8:69::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.35; Tue, 4 Apr 2023 22:03:10 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::3161:c44d:8bb3:423f%3]) with mapi id 15.20.6254.033; Tue, 4 Apr 2023
 22:03:10 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Johan Hovold <johan@kernel.org>
CC:     Oliver Neukum <oneukum@suse.com>,
        Udipto Goswami <quic_ugoswami@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Jack Pham <quic_jackp@quicinc.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Thread-Topic: [PATCH v4] usb: dwc3: debugfs: Prevent any register access when
 devices
Thread-Index: AQHZZtyBQSzEIU4DQUOpQRrLn0wgo68a/QEAgAABE4CAAAmMgIAABqwAgAAGcYCAAKABAA==
Date:   Tue, 4 Apr 2023 22:03:09 +0000
Message-ID: <20230404220306.qasfe3eg5w6eyaki@synopsys.com>
References: <20230404100055.28100-1-quic_ugoswami@quicinc.com>
 <ZCwEeFzSFVRmB/yI@hovoldconsulting.com>
 <9f8277ce-7888-46b7-fe82-90fe4b775762@suse.com>
 <ZCwNYU3kR1Lb2kt5@hovoldconsulting.com>
 <58eaa062-4857-4704-5d5d-ff6ea069e899@suse.com>
 <ZCwYYb/GkE8x6snr@hovoldconsulting.com>
In-Reply-To: <ZCwYYb/GkE8x6snr@hovoldconsulting.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|DM4PR12MB5938:EE_
x-ms-office365-filtering-correlation-id: bae7b15b-abff-41c4-e8af-08db355860a1
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KQ1N+kQ+lRXzjLtkCYvwmyGAAQ11xBKA7LJW+0xUvtScCGQMHtbt25cAWX2hnsHtSf4YRtNHr0ZGkmAjRjWeIfVykQjAKbYO0zklPDZeHMc/gNh0C9rD3N5CPQliW5qWTU3fHaSnCVyP+R5p9Rk75Me/g9y4w2i4a2eeAX4R+EcfL9IFmU9rBv5E1/ID0w7ebC1s2nK2wSIP3v7tCqDYA1dzcShlNndsQz4FDNVGjSfiyC70pGXOUy5dRuy86KsKNjXmYjEWPoEMVetgaR2HFfswUgpiHvdS2j+efn3LsmB6f7h1CQMyA7SwrZ23HG/ETKmK1yYIC/+ixfa+lm+ShAFk0sCexTersKNkLPEZUyf2M03UyJLsMe8/trGe3fcMyvoBtkaF2H2HuGeMduzKSaVK7qOUNQsXLon/TvxdfqLU0PXKow8a09o/KfgyH0SMgOnYJwH/sJl6X8nVji5AxPNLpVx/BAzW/xT3WHmxEWkzOWCTDALkkbhvs/ySq9ZFq8CcAkjI3GCfjzWN5KfsNFLEt9b5FwiYStxptgt20IJiNlIaivfrgVRavxceO4O5LLJCa0v1PXv171F6xiygF5v37Xbxm+XrNH9mkG8DVNaWiTev/qc38UP6sSoy8qac
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(136003)(366004)(39860400002)(346002)(376002)(451199021)(122000001)(36756003)(38100700002)(5660300002)(8676002)(8936002)(66556008)(64756008)(66476007)(76116006)(66946007)(4326008)(38070700005)(86362001)(6916009)(2616005)(66446008)(83380400001)(41300700001)(54906003)(6506007)(1076003)(6512007)(2906002)(53546011)(478600001)(6486002)(186003)(71200400001)(26005)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGh2OENhYUMyTWxaNld0NVhEbVduc2lyMWx4MGFqT0hWK1R1NkYrYmNoVUZZ?=
 =?utf-8?B?M3FKbHFyUVF2MjNXRVQ3Nk5mKzJ1SFlhTjJSaGZ1UTJwbTh0aUtjR0t5NExo?=
 =?utf-8?B?a2lJMnFRU1BlU1pUOTNvNkoxQ3NiRVllTzBCUHFUUERhZVh2azA2OVhFWjdt?=
 =?utf-8?B?N1NXZW1JTkxib0tWVXBmMlRBdVBWSnpwdm5EdnJaUlBTS2tacGFYVWMrYis0?=
 =?utf-8?B?Q25FQXBSMHh6RTV0bUZ6ak1PeGVjaHpidnQrRmlQWFdSTnROUi9oNy9STVh6?=
 =?utf-8?B?SU9iZ1MzUlo4bkNTNi9wZEQ4bEl2alh3a3RFeW9ZTlhHUkRVOEdZTkw5TFJn?=
 =?utf-8?B?Vysxc0JKTnJWd3M5LzB1Z3BMaFl2bzJ1VkEyaDJqdGZ0YTRGbE1lQ3o0VUtq?=
 =?utf-8?B?MUxmU1o5R20vdzNPRWl5b2p2VDdOMGxWZkpHb3NvRzlkdmg2ZUVjVENVNUI1?=
 =?utf-8?B?Snd6NGZ1RGZrZjVza1lLWmt4allJSDlIa1dBM2lVWGdnVHdxeUFxdXBGMUpv?=
 =?utf-8?B?Um9lTC9FVzZPUU95eDNXN2thRmF5ckpEY2xGRkNNcVo1SWVIZ3JNQ2c4Kzkw?=
 =?utf-8?B?ci9PcWdPd2NuRGR6K1Q5OURReXF4RDcwOHNKeVNqcUZqRGJPazJGWndiWTdV?=
 =?utf-8?B?eVJ3Q3IrM1lkNFJpZDkvMURvbzUrUzFIVWRKZFlXUUN4bURjSEFPOGE2ZFpV?=
 =?utf-8?B?L3oyM2JuMXVrSUNUTjlGY1BDaTJlREdiUGhiMWcyZnNQS3dxRTUrUCs5bUg4?=
 =?utf-8?B?VlpPQ2R5QUdBWFdDNUFQZVBhSGpzWE9WUWV6OERzUTBRc3VWREpNUmZNVmlz?=
 =?utf-8?B?YURnWFdYYzV3TXRCYVQrMzkzbmsrRC9xd3dZaFQvQUt0SFMzVm5RZmxoc25V?=
 =?utf-8?B?TzIyMTFUVHlJbmdRY0FtUVBML2JMUndYNXlScG1ZMmNCbkRTbVJuWS9adUR3?=
 =?utf-8?B?Mit4ZEc4akZGTVpoK01XOGg3UTk3d1RxMEZVRE1zVXFuZmtxRmpJNEkvdHVs?=
 =?utf-8?B?ZG10UnU3OElFT282dVp5ZjBuUFArUjZaUHJVNWxYeENyQVcvbFhhVEwvaW9D?=
 =?utf-8?B?bWZqaUJoZ00yTmNIZEh6QzVEUWNNNzhsK1VYeStFWWpvZHJvQ3RvbmJZSm5Z?=
 =?utf-8?B?NXFpRDZZNnpqN1VxZ0Rydkg1MGRHc0trZkl3L2NkWVp6RWFCTkVXc201b2VH?=
 =?utf-8?B?V3VBSVc4SGdzc0F1Q3Y3NXFtSFBxUlBjRUxqaEZNeHBrOERMQVlxYzg2emZh?=
 =?utf-8?B?enR0bGhRTDkwRHM1M1ZpRzk2K0Z0NldCekFaZitaL3JqODRiNTdTYTB5VXp0?=
 =?utf-8?B?eElVTTJkMWc1Tms5QXNnbGNvNkVsRTh1UHhSZk03bXBEVHlCNExqdUtiNWp2?=
 =?utf-8?B?SllFRWJKMExIS210VGF5S3puZ3d4bUIvZDgyNUk1ZXVRZElwU1BIYXpaRkwy?=
 =?utf-8?B?eVBDaHlIK2V6Y0pTOGhIa2pNQjRPT2lYUnRnYUZ2TWJVY0hMRlhiakJhcUts?=
 =?utf-8?B?U0NzUndHT2tBVmM3cWJURkhhOUpnaHlkVUNjRlo5NG1BYkVoaHJLaTc3eU5o?=
 =?utf-8?B?Zmh6YncycU4zem9vRnRtVkpXTUdTOFRadEpqbjVQemdFQm5VVkIvenVjWlhk?=
 =?utf-8?B?SDV6RjZQWUFla3J4UjVRNFN1QU14M3ZOSDdoMm82c09NdjdNUWIvc0s0ZWVR?=
 =?utf-8?B?TUFJYU4xY1BNbEZacmg0TnFIQVpVT3lKcjFGbjV4SXRhYTRqRC8zTzV3UzRP?=
 =?utf-8?B?L2FDMTdudVF1UWxIbG82U0lBOGQ2WmJJTzdZZGdsMXgxcVU1dWVhTHBNOFhJ?=
 =?utf-8?B?aEZzNnVpaEtKQUlBd2ZIV1RKc1hXZVZ2MERDam5NWlpDWHZVcVR0U3ZMdlVo?=
 =?utf-8?B?NjBQZkNtak5mSlZtVER5UzczT0txZ1BIdTZDaDAzUmgzUFVKaW9tRVYxUDl2?=
 =?utf-8?B?aFVxR2NodzJBS2VsdkJyNWhtek1vTDZKQUxXbjJEMXkvYWFtc0p0N1RkaUhX?=
 =?utf-8?B?WFBkUWZaRFhaa1RPMnFSTUd5MTFDejEweDVXNXNqQUpWdjdpQnljVEhvTml4?=
 =?utf-8?B?SHEzTVQzUFpRZUp1Tkh3aVVFVmh4MGlmaS9HRklja25pWTNqWFZHYzZoWUFW?=
 =?utf-8?B?enlidEpFOCt6UC9BNXpmU0hXYWFsVkViSnFJSXd1a3ZoaU1NY01BS1czRWJk?=
 =?utf-8?B?Q2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CB5A101A4FDEBA41B6F72038CD8B590F@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?MUpOTllZaGVnbmdXdjY3SWxpU09KVzg0cE03YVhwcDlKcjdNSW5ubFUxNlJB?=
 =?utf-8?B?WE9sbUdDbFFlQVFla2JKYUlrN0RRWWMwSnRRbEhSNHpPKzBpTFBieXlzMXlL?=
 =?utf-8?B?SkxDOVl3L1RucHp6Vmp5bThjaUY1MkVLa3JEbDlHOHY0MjV6N1F2cWJhbkxY?=
 =?utf-8?B?MTljMTFzSm5LOE1aTzFzUlZwQ3dDc1g1N3NVY1hpdHg5d3Z0amI4VTRmZW0x?=
 =?utf-8?B?cEl5SXJTdXljc1IwcnZZNTBoNEpwWmFsdlVyT3BWREJld0VDMW5MbnM5S0I3?=
 =?utf-8?B?QXphaFZVMHVVdEdURi9GVWdaWUg5WkR2clBicXZnSHJTTk84TWcybWdqQzhl?=
 =?utf-8?B?ME9CNXF6bkdPRWpvQU9iaWhwZU92bVhHNWJTNGlNMWhjWm1nMmMxaDFLZjZO?=
 =?utf-8?B?NDVpVFVrM3B6VUJ1bEpPcHJDQmZZN0poWXp1NWJhMTdoazBVYVp6Z01VMEll?=
 =?utf-8?B?eDdzMEx1d21PYkhWM29KUmFoaDBHQUVmUDRtdHNwQkZucmplVUpiYjF6ZTZP?=
 =?utf-8?B?TkU3cU1xSHhnOGZqS2FYVXFmWkZiZHdDbXR3ZkFKeXdrRnZnUkpIQk1ra1Rz?=
 =?utf-8?B?N1VBb2wyVGdWUnNyYVBkVGwraDFvZ0U1MWg3Y1VlRG9JL2JYWE5uQUd0WUU0?=
 =?utf-8?B?M1VYSDJDcXpFQXR3TTJIVGxnZU0wZDVIL1FjaUE5NmlHRnNPRFlJdWgrS1Bz?=
 =?utf-8?B?MU5iVmQ0eEdJVytzRHJFZEVhbzhQNHZaMzBLd2ViQ3VrQ3V3d2k1SGZ4WFBn?=
 =?utf-8?B?dzFsd0FFZ2FDMFIrSlg3azRtZUVjWW1rZ3dpby8xNlhUVWFFVnVmNDZ1d2U4?=
 =?utf-8?B?eGxWTzY0bmo1NTRFOUNwTEhVSytrNWJUSjhFQmJJUzJqUFdVN1paTU9CcUt4?=
 =?utf-8?B?L2R1UzJpZ2ZLcjVyMHBVMkFLL3hiMlVqNWhYODd5cXh1bVBMaXB6ME5wU1Az?=
 =?utf-8?B?bmQ4dW44RGhJZHZHTFl1VDMzQnlVZ3JzNk5pdlBJUTJCK3kyTCtvVzZqSkFC?=
 =?utf-8?B?dFZ4b2s1dnl0b25DYXYxUmJWNnR0Sy8wNkJqcG91L0tPSjdsS0xnTDBBd1NO?=
 =?utf-8?B?cWROVDFKbmI3Q21lazNOekZSVjhmYzNIMi9hcjZhVWgyZ3NLUWpVV2ZMNXhL?=
 =?utf-8?B?ay82ZldRcmRzVEJwWGx2QzFOZmY0VkVkQ1pRWHdtQVViZzI3WjdQdEwvYjA5?=
 =?utf-8?B?K3JDS2RpWm5Da3NPZC9WL2xsOEhHdjIyNWwvTUhkV2RBZEN5bDl0OHU3Qk1Q?=
 =?utf-8?B?YVJPTVRuUzd6VXZEdk82R1o3NTYrSHFYUkw2aDJRa2hFOW1ldz09?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bae7b15b-abff-41c4-e8af-08db355860a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Apr 2023 22:03:09.7614
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pwChzeemRzoqtpECgGLui1LcCrMUg3KLqiLEOO2n0wRfGhcxIKbUyJbPsnhbRdLIioVNWgRVMRcEV+ZbG2kcLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5938
X-Proofpoint-GUID: MdTvLwJL65HLJze0sk3rMs1hvs4JTc66
X-Proofpoint-ORIG-GUID: MdTvLwJL65HLJze0sk3rMs1hvs4JTc66
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-04_12,2023-04-04_05,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 phishscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304040200
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVHVlLCBBcHIgMDQsIDIwMjMsIEpvaGFuIEhvdm9sZCB3cm90ZToNCj4gT24gVHVlLCBBcHIg
MDQsIDIwMjMgYXQgMDI6MDc6MjJQTSArMDIwMCwgT2xpdmVyIE5ldWt1bSB3cm90ZToNCj4gPiAN
Cj4gPiANCj4gPiBPbiAwNC4wNC4yMyAxMzo0MywgSm9oYW4gSG92b2xkIHdyb3RlOg0KPiA+IA0K
PiA+ID4gVGhlIGRldmljZSBpcyBiZWluZyB1c2VkOyBieSB0aGUgZHJpdmVyIGFuZCB1bHRpbWF0
ZWx5IGJ5IGEgdXNlciB0ZWxsaW5nDQo+ID4gDQo+ID4gSSBhbSBhZnJhaWQgdGhhdCBpcyBqdXN0
IGFuIGFzc3VtcHRpb24gd2UgY2Fubm90IG1ha2UuIFRoZSB1c2VyIG1heSBqdXN0IGFzDQo+ID4g
d2VsbCBiZSByZWFkaW5nIGEgZGV2aWNlIHN0YXRlIGJlZm9yZSBhIGRldmljZSBpcyBiZWluZyB1
c2VkIGFzIHRoYXQgbWF5IG1hdHRlci4NCj4gDQo+IEl0J3MgYSBwZXJmZWN0bHkgdmFsaWQgYXNz
dW1wdGlvbiB0byBtYWtlLCBhbmQgaXQgaXMgd2FzIGFsbCBkcml2ZXJzIGRvDQo+IGZvciBkZWJ1
Z2ZzIChhcyB3ZWxsIGFzIHN5c2ZzKS4gWW91IGFyZSB0aGUgb25lIGFyZ3VpbmcgZm9yIG1ha2lu
ZyBhbg0KPiBleGNlcHRpb24sIHdoaWNoIEkgZG9uJ3QgdGhpbmsgaXMgd2FycmFudGVkLg0KPiAN
Cj4gPiA+IHRoZSBkcml2ZXIgdG8gZG8gc29tZXRoaW5nIG9uIHRoZWlyIGJlaGFsZi4gVGhlIGZh
Y3QgdGhhdCB0aGUgdXNlciBpcw0KPiA+ID4gaW5pdGlhdGluZyBhbiBhY3Rpb24gdGhyb3VnaCBh
biBpbnRlcmZhY2Ugd2hpY2ggaW50ZW5kZWQgZm9yIGRlYnVnZ2luZw0KPiA+ID4gc2hvdWxkIG5v
dCBtYXR0ZXIgKGFuZCB0aGUgdXNlciBhbHdheXMgaGFzIHRoZSBvcHRpb24gdG8gY2hlY2sgdGhl
DQo+ID4gPiBydW50aW1lIHBtIHN0YXRlIGJlZm9yZSBpbml0aWF0aW5nIHRoZSBhY3Rpb24gaWYg
dGhhdCBtYXR0ZXJzIGF0IGFsbCkuDQo+ID4gDQo+ID4gMS4gVGhhdCBpcyBhIHJhY2UgY29uZGl0
aW9uLg0KPiANCj4gU3VyZSwgYnV0IHlvdSBjYW4ndCBoYXZlIGl0IGJvdGggd2F5cy4gWW91ciBw
cm9wb3NlZCBpbnZlcnRlZCBsb2dpYyBpcw0KPiByYWN5IGFzIHlvdSBtYXkgb3IgbWF5IG5vdCBn
ZXQgYW55IGRhdGEuDQo+IA0KPiA+IDIuIFF1aXRlIGEgbG90IG9mIGJ1Z3Mgd2UgYXJlIGxvb2tp
bmcgYXQgaW52b2x2ZSBwb3dlciB0cmFuc2l0aW9ucy4NCj4gPiBZb3UganVzdCBjYW5ub3QgYXNz
dW1lIHRoYXQgYSBkZXZpY2Ugd2lsbCByZWFjdCB0aGUgc2FtZSB3YXkgaWYgaXQgd2FzDQo+ID4g
d2FrZW4gdXAgYmV0d2VlbiBldmVudHMuDQo+IA0KPiBUaGVuIGp1c3QgZG9uJ3QgdXNlIHRoZSBp
bnRlcmZhY2UgaWYgeW91IGZvciB3aGF0ZXZlciByZWFzb24gZG9uJ3Qgd2FudA0KPiB0byB3YWtl
IHRoZSBkZXZpY2UgdXAuDQo+IA0KDQpIb3cgY2FuIHdlIGtub3cgd2hlbiB0byB1c2UgYW5kIHdo
ZW4gbm90IHRvIHVzZSBpdD8gV2UgY2FuJ3QganVzdCByZWx5DQpvbiBydW50aW1lX3N0YXR1cyBm
b3IgdGhhdC4gVGhlIGRldmljZSBjYW4gZ28gaW50byBzdXNwZW5kIGFueSB0aW1lLg0KDQpUaGFu
a3MsDQpUaGluaA==
