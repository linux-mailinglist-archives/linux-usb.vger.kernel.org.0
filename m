Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6AE5662EB92
	for <lists+linux-usb@lfdr.de>; Fri, 18 Nov 2022 03:02:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234902AbiKRCCJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 17 Nov 2022 21:02:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232004AbiKRCCH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 17 Nov 2022 21:02:07 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81F7E74AA0
        for <linux-usb@vger.kernel.org>; Thu, 17 Nov 2022 18:02:05 -0800 (PST)
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AI1jnxs016794;
        Thu, 17 Nov 2022 18:02:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=dwb47w76BSIlOaOpFOebQepYVs5/5iATvgw5IkzsXlA=;
 b=p3+brH3VuDrO3zk4qGWfBbBdqNsYsIEMmqDY3fAHdLMbve9DCGxuUDX+bF86uPXET031
 rMZ46T8UkjpWWdIkDf4jaQf9bagxQe4NJs2u3foJDFX7GoHVL3GKZhLMJbGAmiPdXcuw
 q/MpZcWuqw1WWH3dkk24Kv8wcwg029AN7Ic7/rgzRRFhO/H0nLQ9NZraMxr0QkD2F/K6
 aR5Ib+qzmKHCezq+MuyC/anWwyMqmrzOpUMRAtna9y1dzEa0zCnDvwKjzFVKMCbCcp/c
 ItRiUjZ+Rb5aAq+CoKOPOfwsVE8OwAa+CCHD9Ae4k1kg+bPVcjcja+XuyyIfJ1mbsIgj tw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3kx0p201y8-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 17 Nov 2022 18:02:02 -0800
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 802F3C07FD;
        Fri, 18 Nov 2022 02:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1668736921; bh=dwb47w76BSIlOaOpFOebQepYVs5/5iATvgw5IkzsXlA=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=J4IyaExu4UlpWU94O0r088//ym+iXy4KbNRzw7LAC1iKhOmQE3Xtkr9wO0+mxL36C
         gF92R6uhUAZdqwEKm9n4dbSlHWR6u3nx8s1RI0kPon29rajAvU4z6Dy4fKD3MvLZC1
         q1LFeXgXzU4bHBnoqhQUT+zbzHiyOZWQMpXm2pJGrcwFpZJA6SaANr2NG1+ENctBhQ
         ve1dY5jakI7zmKE/ctJAybGria6xLixOwcjm5I3qsznNmHzWuM0HTxxwHR/TDiP75N
         e646qZ/hMcowSbZgaPQTjwmrlaE9BeW92psSx5JwB2sJegmAdp5aZjfscADRppY45a
         NfDu+k1NGhjtg==
Received: from o365relay-in.synopsys.com (sv2-o365relay7.synopsys.com [10.202.1.143])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 0F2C1A00AB;
        Fri, 18 Nov 2022 02:02:00 +0000 (UTC)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0FFECA009E;
        Fri, 18 Nov 2022 02:02:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l7wgAtNbI3Mcx/m+fR6WU/KxLJe40MWvtWkc1jMHikc8RZk+Xy7cfzEP9Qq3eFChCmOELAo7mIOlxsi/BwlZeGp1SdhE7i7XQ8fMDDfeFKUK1XuT8OFTs8G8LYkkaL9EYrNWDLDysbPUyJZDsQVYw6SCSxNAwSf+7jteVWmpzS06vDUy33k2YVWYhvZ5Z7ANLbeAslwwOKLcesuedhPTPywFybw5sJ9yTDukkNKR6YojoRt5i+50eG72efD43KsjD6uN+7/HNoyubehSpSA1hkDhz4sLvrz55LV3jajWylA7QT2RyiCVRT+IFLLWgOuuLvGz1SMZ+aJizYDbwHRKvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dwb47w76BSIlOaOpFOebQepYVs5/5iATvgw5IkzsXlA=;
 b=iOIn0KkUiL7CrACvXUhdqdqS7JCKfM5Dq6gn+s25q1AmHdQxxSTf/X2VLQge9vZq+YJR0FIbie0iDdzu2QuJVqoCOObIPy2yDAvDyFqt1YeU5wHgQFQC4zB7UzCXvSZQu/bcCIyt8E+ghgkBPYvxWmX1T+5eo2nUAoAUR+y1pUqRUedFDX8Vc0JU3bHlopTvAsO9Z+xgoN3hW1gnjEwi3Jm2MzRH8BW4bSdLICGC/ho5ORazCWhHnxRlOdZL44bJZbc+x83UgwHkvMHpqlYyHKOedONtpFMGooPjiuKS/1JRlneq09l1fIo3Vhgg2xqaXf9VgtP5Brx/hHwf4EdaPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dwb47w76BSIlOaOpFOebQepYVs5/5iATvgw5IkzsXlA=;
 b=wPwR+PI+W3OYBdMqQB+jQgKsYrFYo2NHAinUMlekNlC1C/klgf5qCeeaFvSKXY6T13lpPIM1LuA85Au7IRUfSB/8b9KEot/RMHN5uq83z/QkU67C6HRnVgwm4xVdS0qZiWr8kOd/OEMa76wpte2MKcPagCbMu+n6BxHZtP2UKJQ=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by MN0PR12MB5739.namprd12.prod.outlook.com (2603:10b6:208:372::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.19; Fri, 18 Nov
 2022 02:01:54 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::9f62:5df9:ad93:5a1f]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::9f62:5df9:ad93:5a1f%2]) with mapi id 15.20.5813.020; Fri, 18 Nov 2022
 02:01:54 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Udipto Goswami <quic_ugoswami@quicinc.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Jack Pham <quic_jackp@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>
Subject: Re: [PATCH] usb: dwc3: ep0: Add implementation of ep0_dequeue
 separately
Thread-Topic: [PATCH] usb: dwc3: ep0: Add implementation of ep0_dequeue
 separately
Thread-Index: AQHY+khxkuNi6ALG7k2qI+0H9sR18a5D7tWA
Date:   Fri, 18 Nov 2022 02:01:54 +0000
Message-ID: <20221118020141.fjngcaovttbzkbvv@synopsys.com>
References: <20221117054917.30104-1-quic_ugoswami@quicinc.com>
In-Reply-To: <20221117054917.30104-1-quic_ugoswami@quicinc.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|MN0PR12MB5739:EE_
x-ms-office365-filtering-correlation-id: 26764339-5110-4d3a-f830-08dac908ddbc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oHalKW0c7G3IlEjrYuL+jWNidmbuy8d9IY/1NkPpwCzG5r0F7EvgYOV2f7sVikuAfCUnDtlu30s4mkWOV9MhpNrmbFswtHWQH8tr6ZIXyHxgbitMag98rHZDbF2wJMo8Cy2fcJVSn9Js4xIS+esXZ7Hx2vK1181GW7nxALE33pUhtQGfWqlAN+Wg/6U6gTFRn+GuqPDa/pa1e2OE9t7jSnUavxFLEtizW4jMYZ2HmXpy7zgnl7rjhehH/JPwyM+akRBlj1o2s0wR9HMyGv3/wNlK9/z/cu0/hgvg2w/9Bl4U/pkUXmuSaehzLkFrwdJnhyjoHWQFcK+VlEMoyCmcU398AJbiRZi1KHeDd8PEqRVeW7YiI1I0yF0zxYMQ0LSHkNZpJUCxkPrsTYtYhAeBVwzkFRFnbhSrjK5LKIItxWlr9vDQ/7Ml3vnMQ8usRxqzSyefWgxWTB7YCJ3nhScQCBRB0WT/dKQqSKq4QnYTPCOMAaghs3zVtf0ecqE1bFyVeg5cwG/0XDPufBxmiNJggt5EmxRqzcfxvZG0byruSEcPBdks3Vc7vyVyctJ1UCCMyMG2Qzh7yOv6EupQnd8eeI310yLnXiNqtIsqqjsJ3Q18TllPSB8WxPylorQ6CsWOhGZFBB1aEDQCPrGhxVgxO7IU+VOcq96+AFqrZd8kSiv9OPDXzJo8L60mGkr+oUbjU8F/BMPDq36hJROoqBiA6wvozcW1yuONna32PgGQs2c=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199015)(6486002)(71200400001)(478600001)(66946007)(66556008)(8676002)(64756008)(54906003)(26005)(76116006)(316002)(6512007)(66476007)(66446008)(36756003)(4326008)(8936002)(186003)(1076003)(2616005)(5660300002)(3716004)(83380400001)(38100700002)(2906002)(86362001)(122000001)(6916009)(41300700001)(6506007)(38070700005)(309714004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MXFTNUlCYWhuWVlobllvQitZM0syY3lOV0FFMklvZFNXY1VxVitTWXl0aURE?=
 =?utf-8?B?ZXBXVVE0aDB6RHliSXhmYm8yNjIxcW9iWmtZVkt3UkUwN2JGY2tCZkcwSzFi?=
 =?utf-8?B?QlRXWVRGczFvRHplRmJWVEFvcDVGVkdCRzJ5Z3RhemJtMTJsTWVGL24xSE15?=
 =?utf-8?B?czNDQTZDNDVlWklhQUV1cUxhc0FSWlZOTk9hMUw4REdjNFNhUkl2Ti9EbUdG?=
 =?utf-8?B?aHlUMHBZaVg4aEh0cGlidEV5NXRlVlpUTnhKdnUyVCtYTWlzUEtrSEQ1bW0y?=
 =?utf-8?B?a04rbTJIUDN3TTY5dzJmZEtXYXR3VVF4b05XczZtVTQ1Nm0rSHQzRFRKbHVm?=
 =?utf-8?B?bUpTbDRtWmxXbmR4ZWpacTMzejIranEwY1JmVkJwVWNEWU5XcjA0VUpiRk41?=
 =?utf-8?B?Qm1mYWpzb3RPcjdERWlsVnA0VzAxeE9aeVVHRzA4eTc5MzRUR1hjV3pvMU15?=
 =?utf-8?B?eHlaaTYrd2lwaDRlOU5PUUVvb1laM3pLeE10THVlSTZCQmdrSnZFY3NhbDdr?=
 =?utf-8?B?cTErci9PN0RmWkRsMGJrZEs5dzNOK2VvZTZDYm93UUE5NVRJUkI4S28zMzB3?=
 =?utf-8?B?c0tqZkh2Mmt6V0wxWkhYRGp2RHlsNG9aWnMvK1BJaU5Wb3JqR2piU0wwTjZE?=
 =?utf-8?B?Y3Q1bHZnQmpJcTVsK1dHak5PTEN6dEo2TktGU3Q5MzU5TDdxVjRndjZ3RmRX?=
 =?utf-8?B?eHEzbFRDWXhtQk42WXhpYWNpa25ibnhxaUhEV2F5V0lkYkxNTWFGUlhPdE05?=
 =?utf-8?B?a2M2cHpWWllBakMxVGIycy9zYTZVamxRUElVZG1VNTkvSDE3RFhNL1I5ZTM5?=
 =?utf-8?B?aUc1ZEw5eXRZWE5xKzlQZms5QWxTa3FvbGVCT3FvdXN3MnJZSldUUVQ0V2Zl?=
 =?utf-8?B?MVR1N0pCWFpLYW5GWmkrOFllR0RScTVkVG0xeGp1Q2MxNzVUVVZ6bDZjS2lt?=
 =?utf-8?B?TTdteTN5T3IvWHFqS3FSaWJyL2hlUmNsZU9tRDZraU1mMGFPQzVGeWtYMlpT?=
 =?utf-8?B?Y2VNQkZzblNKZEFGQ2JjMUlyZWoxRUJiMUZtVUt0UzZ6SHlaWkhWZGI1VXR0?=
 =?utf-8?B?cEhFakNXdE1PbGZyVk5GaktXQTRCRWIvZzNKZjQ5VG5SdTFZYTB5MXBzK2ox?=
 =?utf-8?B?MmkzdlhVbWprYy9PaW05anNQY2Z1b1d5eENSZTlvakZPMGhxbUpqRnZzelRX?=
 =?utf-8?B?TWM2bmhNazREcS9IUUpsS2N5eUxBUll5YzZaWitzVUZtaWpVMVlHV0NEYlRF?=
 =?utf-8?B?TldmcEszaVBOZmprWFErMzlTdk5KZFQrOWl4NVROY1lXM2NEeU9yMkpuMjBk?=
 =?utf-8?B?ZlQvdTJQWlFvUTU3SDAvWURjMDZueExDaGh1M0NIdDg4SmhaTUpXVHJLNDlN?=
 =?utf-8?B?dUVIZmZvOUR3NGgxbFI2UFN6YWxVQ3lLSUZQajhSMy8zdjhjQlBPT1RUZ0xO?=
 =?utf-8?B?Tkd1VkpUUWJjbTBGTFI5aUFKUFkyQ1NDaGxldGRZR3M4YXN2VldEaHhkZzNa?=
 =?utf-8?B?ZjlxeFYva1UzVHBjdElIRGFNRDJGbFk5WDByYXBRYXMzb2VVTys5YThMVWVq?=
 =?utf-8?B?T203aHJZMG10eUFtd0lwUkNHM2cwRGhhM3ZMbzkvdmhJV3g0NTVwaDljZnlr?=
 =?utf-8?B?cjdyNEN6VExudytrVWg5QXoxNEZPZURCbVA0KzAvNndwUjlMbzBUbytQaUNv?=
 =?utf-8?B?OWZVL1VjRDR2YWd0TmdmTndiUDZGbTltRmVUWHI5R1NYTCtJU29NbElPR0F3?=
 =?utf-8?B?M0Z4YTgxTUdxQndIQ2JPVUFNUnFjdXZDZExiV0xXd1BtMWFmaXRsaFZxcjlu?=
 =?utf-8?B?RExsOVZIaUtYVldoeTlicEljdFl0WmJSRitSZXZqU3MxbGpNa1hXN2R0Qnhl?=
 =?utf-8?B?VG9sQUlqUU5tL0pHL1U4cnpBSWhXNlNWODdBS295ZHZ5NTZ6RW1TNG1mRGpP?=
 =?utf-8?B?cGRnMEUyTVpmQnVuZGEya0lzY3FnZGo1RzZ3b2NxMXNZVVVKOW55T21OOS9q?=
 =?utf-8?B?QTBvL3VUTE1nbk5oOHg5a2FSVDkwRXVpaFJZRlFQbytta3YvUEFicXdzT21V?=
 =?utf-8?B?SVV1d3FYTjJSV2k5K0laTzVkRmZZajhRYWkreVM1bTJESGZUZjZ0K21vcjQ2?=
 =?utf-8?Q?HKbo8AGLSLmrvWMfonUM0ChPM?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0AA6E7E44F21424F9A01AD3385C53292@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?dmtLS29qSUd1OUM1UUk4Mzc2WTN6N2pjaGxLU0p3RkU5VElLVFF4S1BRYkZi?=
 =?utf-8?B?cW5Wa0krSDh5RVFxOGZLMVBOQVR4em9Vb3A2Y05PZzFEU0JLNTRqNmlnL2tv?=
 =?utf-8?B?Ym9Ja0dZOXpYU2loYXo5aVFtempGYkIrK2JETXNPN0hoT2VhSnZXK3VHSmtu?=
 =?utf-8?B?MUNIWWVoOWplY204QjdYM01nQ3EvUjUxb3ZUK3FrU3EzNVhNWnRSUmtadXZE?=
 =?utf-8?B?bUoyZEEzNzgwRFNGRU9kemFuSnBQZWRMaVEzMEQySlgvaFJ5TzI2SGM5MzJX?=
 =?utf-8?B?YmlXbVBvVEJYNWlUNnJDTVU4Lzl3THVMU2o2b0RaMDg4Y2Zqcm1JaFdyQUFG?=
 =?utf-8?B?R1M2cFFtNGRzSndnS1VDbXZaWGlEMnlnMEJVUDVYWmE1dEwrUmNvRjVkREp0?=
 =?utf-8?B?SmVPbXlzQWJEbit5a2o1STBlNDMvR2IyRHBXWmhRbDUwMzdTWk9EbzNUWHlp?=
 =?utf-8?B?MCswVU5QbEpMdnVDMnhVVjRvOTl1SERmNk5YM3hyeHYvRk5yclgwcHF1NWJC?=
 =?utf-8?B?RVNrRitOR0dSQVc3dk00OTlkVEI5V0hLc0RUL3hhb1VHeWNOdWJJWExKL0pJ?=
 =?utf-8?B?aWdBN1Jpd3FMa2o0RnBpNEdmMjhmeVdEeU10cHRmZGIvcE45R3luS0R1N1RQ?=
 =?utf-8?B?R0RCU0ViakFqMmprdEhPYytrVFZBRUNWSUtueEUrMlBGTHRGcksyandzaUxO?=
 =?utf-8?B?UlROdTFJb1U2WVg0bXVhaTR0eGtZQWRsM2J1TVRhZ01qVlJNRDBlRndZNVNp?=
 =?utf-8?B?S2RHbG1CUWYzZVIwdXBaOW04Q1lMS2h4N0lnNlFzTHpRQ24vUXRZTElGVGw5?=
 =?utf-8?B?b29JZjF3NTB5MUFLVURXeEp0YU1JWFRHaVNrZVovblNHYWlQRkZrOHdxcURr?=
 =?utf-8?B?UW5aOUUvdVM3NVVpeXNWYWFwTGhNaG5TcWNNazFSWldHVjBYOG5vK3BnWUxM?=
 =?utf-8?B?d0ltV01SSm1NNkVjbTNKMWNkeVQ1OWdPeFhFbzNLZVVoQkVFOUw1WVRYYTdq?=
 =?utf-8?B?WFp4T3RhVGVPNVlPZlY2NnFrMXJ4eTVwQlFDSE55Y1E5TTI3ZUN5TXZxZ3Y0?=
 =?utf-8?B?RWVpem85eFdFK216UXdYUGR1QlBmQnpGc3BIeWxHeTVJK1NBOG9QRjZiN0lR?=
 =?utf-8?B?UGI1cmxheVo1NlJkQk4ycEtvbGZqQktrS0hyYWE3RUJoR0gwaTRCUEUya1Ux?=
 =?utf-8?B?cVUxTzIxcHp2ZmEvbUZNYzN4VnVZNnFva3EyZ3JrKzZteWxJZ1lubWVFQ3Mw?=
 =?utf-8?B?U3pnenM3T005WitJTElYdjRhUkU2OTlqU2QvZXl2QUd4Q2Q0S0pJSFlHMWI3?=
 =?utf-8?Q?3SpvjMw4J0piQ=3D?=
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26764339-5110-4d3a-f830-08dac908ddbc
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2022 02:01:54.3260
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gXpRvK8iRXeFQZQDNK8A6jQhxRpZAscNwbiYPDP5BZzwGSz7XeHM3McYb5RDWP0JvQ3Q0agxjk8kkWsSERZGXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5739
X-Proofpoint-ORIG-GUID: 1bnw7gCpq6kiO5mZntTcnc8J5uczhdTy
X-Proofpoint-GUID: 1bnw7gCpq6kiO5mZntTcnc8J5uczhdTy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=578 spamscore=0
 clxscore=1011 mlxscore=0 lowpriorityscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211180009
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBOb3YgMTcsIDIwMjIsIFVkaXB0byBHb3N3YW1pIHdyb3RlOg0KPiBBIGRlcXVldWUg
Zm9yIGVwMCBuZWVkIHRvIGFkanVzdCB0aGUgaGFuZGxpbmcgYmFzZWQgb24gdGhlDQo+IGRhdGEg
c3RhZ2UgYW5kIHN0YXR1cyBzdGFnZS4gQ3VycmVudGx5IGlmIGVwMCBpcyBpbiBkYXRhL3N0YXR1
cw0KPiBzdGFnZSB0aGUgaGFuZGxpbmcgaXNuJ3QgdGhhdCBkaWZmZXJlbnQsIGRyaXZlciB3aWxs
IHRyeSBnaXZlYmFjaw0KPiBhcyBwYXJ0IG9mIGRlcXVldWUgcHJvY2VzcyB3aGljaCBtaWdodCBw
b3RlbnRpYWxseSBsZWFkIHRvIHRoZQ0KPiBjb250cm9sbGVyIGFjY2Vzc2luZyBpbnZhbGlkIHRy
YnMuDQo+IA0KPiBBbHNvIGZvciBlcDAgdGhlIHJlcXVlc3RzIGFyZW4ndCBtb3ZlZCBpbnRvIHRo
ZSBzdGFydGVkX2xpc3QsDQo+IHdoaWNoIG1pZ2h0IHBvdGVudGlhbGx5IGxlYWQgdG8gdGhlIHVu
LW1hcHBpbmcgb2YgdGhlIHJlcXVlc3QNCj4gYnVmZmVycyB3aXRob3V0IHNlbmRpbmcgZW5keGZl
ci4NCg0KTWF5YmUgd2UgbmVlZCB0byB0cmFjayBzdGFydGVkX2xpc3QgZm9yIGNvbnRyb2wgZW5k
cG9pbnQ/IElmIHRoZSByZXF1ZXN0DQppc24ndCBwcmVwYXJlZCB5ZXQgb3IgdGhhdCB0aGUgdHJh
bnNmZXIgaGFkIGNvbXBsZXRlZCwgdGhlbiB0aGVyZSdzIG5vDQpuZWVkIHRvIGlzc3VlIEVuZCBU
cmFuZmVyIGNvbW1hbmQuDQoNCkJ1dCBJIGJlbGlldmUgc2VuZGluZyBFbmQgVHJhbnNmZXIgZm9y
IGluYWN0aXZlIGVuZHBvaW50IHNob3VsZCBiZSBmaW5lDQphbHNvLiBUaGVuIHdlIG1heWJlIGFi
bGUgdG8gZ2V0IGF3YXkgd2l0aG91dCBjaGVja2luZyB0aGUgc3RhcnRlZCBsaXN0Lg0KSWYgeW91
J3JlIHBsYW5uaW5nIHRvIGRvIHRoYXQsIHBsZWFzZSB0ZXN0IGFuZCBub3RlIGl0IHNvbWV3aGVy
ZS4NCg0KPiANCj4gRml4IHRoaXMgYnkgaW1wbGVtZW50aW5nIGEgc2VwYXJhdGUgZXAwIGRlcXVl
dWUgZnVuY3Rpb24gd2hlcmUNCj4gaWYgZXAwIGlzIHN0aWxsIGluIGRhdGEgcGhhc2UsIGRyaXZl
ciB3aWxsIHBlcmZvcm0gc3RhbGwgYW5kDQo+IHJlc3RhcnQuDQo+IA0KPiBGaXhlczogNzIyNDZk
YTQwZjM3ICgidXNiOiBJbnRyb2R1Y2UgRGVzaWduV2FyZSBVU0IzIERSRCBEcml2ZXIiKQ0KPiBT
aWduZWQtb2ZmLWJ5OiBVZGlwdG8gR29zd2FtaSA8cXVpY191Z29zd2FtaUBxdWljaW5jLmNvbT4N
Cj4gLS0tDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2VwMC5jICAgIHwgMjcgKysrKysrKysrKysrKysr
KysrKysrKysrKysrDQo+ICBkcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jIHwgIDMgKy0tDQo+ICBk
cml2ZXJzL3VzYi9kd2MzL2dhZGdldC5oIHwgIDEgKw0KPiAgMyBmaWxlcyBjaGFuZ2VkLCAyOSBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
dXNiL2R3YzMvZXAwLmMgYi9kcml2ZXJzL3VzYi9kd2MzL2VwMC5jDQo+IGluZGV4IDYxZGU2OTM0
NjFkYS4uNzBiNmRmODNkNzZlIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2VwMC5j
DQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3YzMvZXAwLmMNCj4gQEAgLTEyMDYsMyArMTIwNiwzMCBA
QCB2b2lkIGR3YzNfZXAwX2ludGVycnVwdChzdHJ1Y3QgZHdjMyAqZHdjLA0KPiAgCQlicmVhazsN
Cj4gIAl9DQo+ICB9DQo+ICsNCj4gK2ludCBkd2MzX2dhZGdldF9lcDBfZGVxdWV1ZShzdHJ1Y3Qg
dXNiX2VwICplcCwgc3RydWN0IHVzYl9yZXF1ZXN0ICpyZXF1ZXN0KQ0KPiArew0KPiArCXN0cnVj
dCBkd2MzX3JlcXVlc3QJCSpyZXEgPSB0b19kd2MzX3JlcXVlc3QocmVxdWVzdCk7DQo+ICsJc3Ry
dWN0IGR3YzNfZXAJCQkqZGVwID0gdG9fZHdjM19lcChlcCk7DQo+ICsJc3RydWN0IGR3YzMJCQkq
ZHdjID0gZGVwLT5kd2M7DQo+ICsJdW5zaWduZWQgbG9uZwkJCWZsYWdzOw0KPiArDQoNCk5lZWQg
dG8gY2hlY2sgaWYgdGhlIGNvbnRyb2wgdHJhbnNmZXIgaXMgYWN0aXZlIGFuZCB0aGUgaW5wdXQg
cmVxdWVzdCBpcw0KdGhlIHZhbGlkIHJlcXVlc3QgdG8gZGVxdWV1ZS4gUmV0dXJuIGVycm9yIGNv
ZGUgaWYgaXQncyBub3QuDQoNCj4gKwl0cmFjZV9kd2MzX2VwX2RlcXVldWUocmVxKTsNCj4gKwlz
cGluX2xvY2tfaXJxc2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICsNCj4gKwlpZiAoZHdjLT5l
cDBzdGF0ZSAhPSBFUDBfU0VUVVBfUEhBU0UpIHsNCj4gKwkJdW5zaWduZWQgaW50IGRpcjsNCj4g
Kw0KPiArCQlkaXIgPSAhIWR3Yy0+ZXAwX2V4cGVjdF9pbjsNCj4gKwkJaWYgKGR3Yy0+ZXAwc3Rh
dGUgPT0gRVAwX0RBVEFfUEhBU0UpDQo+ICsJCQlkd2MzX2VwMF9lbmRfY29udHJvbF9kYXRhKGR3
YywgZHdjLT5lcHNbZGlyXSk7DQo+ICsJCWVsc2UNCj4gKwkJCWR3YzNfZXAwX2VuZF9jb250cm9s
X2RhdGEoZHdjLCBkd2MtPmVwc1shZGlyXSk7DQoNCldoYXQgaWYgdGhlIHN0YXR1cyBzdGFnZSBp
cyBhY3RpdmU/IE1heSBuZWVkIHRvIGNoZWNrIGZvciBhY3RpdmUgc3RhdHVzDQpzdGFnZSBpbiBv
dGhlciBwbGFjZXMgdG8gaXNzdWUgRW5kIFRyYW5zZmVyIHRvby4NCg0KPiArDQo+ICsJCWR3YzNf
ZXAwX3N0YWxsX2FuZF9yZXN0YXJ0KGR3Yyk7DQo+ICsJfQ0KPiArDQo+ICsJc3Bpbl91bmxvY2tf
aXJxcmVzdG9yZSgmZHdjLT5sb2NrLCBmbGFncyk7DQo+ICsNCj4gKwlyZXR1cm4gMDsNCj4gK30N
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmMgYi9kcml2ZXJzL3VzYi9k
d2MzL2dhZGdldC5jDQo+IGluZGV4IDVmZTJkMTM2ZGZmNS4uM2E4Y2EyN2ViNWVlIDEwMDY0NA0K
PiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5jDQo+ICsrKyBiL2RyaXZlcnMvdXNiL2R3
YzMvZ2FkZ2V0LmMNCj4gQEAgLTIwNTgsNyArMjA1OCw2IEBAIHN0YXRpYyBpbnQgZHdjM19nYWRn
ZXRfZXBfZGVxdWV1ZShzdHJ1Y3QgdXNiX2VwICplcCwNCj4gIAlpbnQJCQkJcmV0ID0gMDsNCj4g
IA0KPiAgCXRyYWNlX2R3YzNfZXBfZGVxdWV1ZShyZXEpOw0KPiAtDQoNCkNhbiB3ZSBrZWVwIHRo
aXMgbmV3IGxpbmU/DQoNCj4gIAlzcGluX2xvY2tfaXJxc2F2ZSgmZHdjLT5sb2NrLCBmbGFncyk7
DQo+ICANCj4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KHIsICZkZXAtPmNhbmNlbGxlZF9saXN0LCBs
aXN0KSB7DQo+IEBAIC0yMjM5LDcgKzIyMzgsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHVzYl9l
cF9vcHMgZHdjM19nYWRnZXRfZXAwX29wcyA9IHsNCj4gIAkuYWxsb2NfcmVxdWVzdAk9IGR3YzNf
Z2FkZ2V0X2VwX2FsbG9jX3JlcXVlc3QsDQo+ICAJLmZyZWVfcmVxdWVzdAk9IGR3YzNfZ2FkZ2V0
X2VwX2ZyZWVfcmVxdWVzdCwNCj4gIAkucXVldWUJCT0gZHdjM19nYWRnZXRfZXAwX3F1ZXVlLA0K
PiAtCS5kZXF1ZXVlCT0gZHdjM19nYWRnZXRfZXBfZGVxdWV1ZSwNCj4gKwkuZGVxdWV1ZQk9IGR3
YzNfZ2FkZ2V0X2VwMF9kZXF1ZXVlLA0KPiAgCS5zZXRfaGFsdAk9IGR3YzNfZ2FkZ2V0X2VwMF9z
ZXRfaGFsdCwNCj4gIAkuc2V0X3dlZGdlCT0gZHdjM19nYWRnZXRfZXBfc2V0X3dlZGdlLA0KPiAg
fTsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvdXNiL2R3YzMvZ2FkZ2V0LmggYi9kcml2ZXJzL3Vz
Yi9kd2MzL2dhZGdldC5oDQo+IGluZGV4IDU1YTU2Y2Y2N2Q3My4uMTE1MzIxY2IzNGIzIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3VzYi9kd2MzL2dhZGdldC5oDQo+ICsrKyBiL2RyaXZlcnMvdXNi
L2R3YzMvZ2FkZ2V0LmgNCj4gQEAgLTExNiw2ICsxMTYsNyBAQCBpbnQgX19kd2MzX2dhZGdldF9l
cDBfc2V0X2hhbHQoc3RydWN0IHVzYl9lcCAqZXAsIGludCB2YWx1ZSk7DQo+ICBpbnQgZHdjM19n
YWRnZXRfZXAwX3NldF9oYWx0KHN0cnVjdCB1c2JfZXAgKmVwLCBpbnQgdmFsdWUpOw0KPiAgaW50
IGR3YzNfZ2FkZ2V0X2VwMF9xdWV1ZShzdHJ1Y3QgdXNiX2VwICplcCwgc3RydWN0IHVzYl9yZXF1
ZXN0ICpyZXF1ZXN0LA0KPiAgCQlnZnBfdCBnZnBfZmxhZ3MpOw0KPiAraW50IGR3YzNfZ2FkZ2V0
X2VwMF9kZXF1ZXVlKHN0cnVjdCB1c2JfZXAgKmVwLCBzdHJ1Y3QgdXNiX3JlcXVlc3QgKnJlcXVl
c3QpOw0KPiAgaW50IF9fZHdjM19nYWRnZXRfZXBfc2V0X2hhbHQoc3RydWN0IGR3YzNfZXAgKmRl
cCwgaW50IHZhbHVlLCBpbnQgcHJvdG9jb2wpOw0KPiAgdm9pZCBkd2MzX2VwMF9zZW5kX2RlbGF5
ZWRfc3RhdHVzKHN0cnVjdCBkd2MzICpkd2MpOw0KPiAgdm9pZCBkd2MzX3N0b3BfYWN0aXZlX3Ry
YW5zZmVyKHN0cnVjdCBkd2MzX2VwICpkZXAsIGJvb2wgZm9yY2UsIGJvb2wgaW50ZXJydXB0KTsN
Cj4gLS0gDQo+IDIuMTcuMQ0KPiANCg0KVGhhbmtzLA0KVGhpbmg=
