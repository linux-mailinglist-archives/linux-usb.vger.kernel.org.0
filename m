Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85A1367DA15
	for <lists+linux-usb@lfdr.de>; Fri, 27 Jan 2023 00:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233171AbjAZX6e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Jan 2023 18:58:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233156AbjAZX6Y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Jan 2023 18:58:24 -0500
Received: from mx0a-00230701.pphosted.com (mx0a-00230701.pphosted.com [148.163.156.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7CD23658
        for <linux-usb@vger.kernel.org>; Thu, 26 Jan 2023 15:57:56 -0800 (PST)
Received: from pps.filterd (m0098571.ppops.net [127.0.0.1])
        by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30QKH1Tk000509;
        Thu, 26 Jan 2023 15:57:18 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=pfptdkimsnps;
 bh=rVZuqOK2vfIo11sZ/I+E3dBtkj0U84jXXu6s48WXPNU=;
 b=SKEmgbrcSJt+0j/j1QEAGbos35SPfhmf/93337GSU+dsOF4TrHva+WzEwxmbMmh5ZM2A
 XFRQ80Pelzu6P6CidqhZrebJ3dkxwiVRb05CO70aG5ecONE64+CrtlMH4EXlrCyptOR6
 RyZipZuRRqal7M578uhaU7SctitfVEm6PrEE+tldUNmCTNK6rnc48sRXh3hF+bI0eEw3
 qoPBLqvnrzbnMTcaUGqOd6wCZgx9elRbc76CM2LfRZ3QDDVWdROKQrQaRMpyuBLGAbdr
 m7SHPi7ugGHcmKSwstq6Lt8aJB9YvNhf28UBAyB18xaMvyPtzp+rVAIdNliZSkuQnngJ OA== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
        by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3n8fxryeyj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 26 Jan 2023 15:57:18 -0800
Received: from mailhost.synopsys.com (us03-mailhost1.synopsys.com [10.4.17.17])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
        by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 8FD3FC0100;
        Thu, 26 Jan 2023 23:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
        t=1674777437; bh=rVZuqOK2vfIo11sZ/I+E3dBtkj0U84jXXu6s48WXPNU=;
        h=From:To:CC:Subject:Date:References:In-Reply-To:From;
        b=CHfNQiXYG06K232mNNxSYcpZx0uX+/NRlH8Ltgp4JA6D1O+/sxEQymI0UPz+y7p0I
         H8b0+tbSH3yi/xtp5BhSjHwR9t0Fu1PgEv2N8tLX2mK2vNhQRworRNwSL/TltieZVl
         uRIbtPTpRSsO3wpuEnOLxFZH76Lewa8hvIC2e4F7AQchEaQQzBTkAEYmAKI9sMCIQ3
         pvO+Cg5G0jyxRJbXjiRZN02ge8U5Nrd/oVrxTVOfTiW1oQYpvLp4vs8hD6Ul59qSuW
         B4ooV0yBKwIRtNt11D9qZ6LnOVrW7pJuUnWAx/2gWutqzrmkR/KF45fUUrGvfAmB2o
         6ZxjXtcdVJpnA==
Received: from o365relay-in.synopsys.com (unknown [10.4.161.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client CN "o365relay-in.synopsys.com", Issuer "Entrust Certification Authority - L1K" (verified OK))
        by mailhost.synopsys.com (Postfix) with ESMTPS id 59CE5A005C;
        Thu, 26 Jan 2023 23:57:11 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02lp2041.outbound.protection.outlook.com [104.47.57.41])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "mail.protection.outlook.com", Issuer "DigiCert Cloud Services CA-1" (verified OK))
        by o365relay-in.synopsys.com (Postfix) with ESMTPS id 84906800DF;
        Thu, 26 Jan 2023 23:57:10 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=thinhn@synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
        dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="P95lNrGd";
        dkim-atps=neutral
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fPxftqUSD/14SwYMnx/kVVAiV6iUvhKrUvBAb/zGb/LFpjbgAbuOz4GwoOwKomlleBhwyFyUbW1rEgVTiC7s2F8RG8Wb5yWtuNzCcuivFLBuZFvT1Pt2vigTe2Z/J2ZoX+ohLWYZvuqx4JgptgVMZ8tE1gTjLmiEDCo4Dp0Ji5fwpA9gsq67K1AXAKMZ3sN7HvZYMDQyG2M1czgdsijnFMLgY7ozlN+tAm3nt9runnlIMa2+O6q/AL0jNs6Xz5c9cnKDzNN6hzZKBp0kTtJQ7QqrMDEiNCy5FgAJ355IQjADr0cffGKczzTm9plPISN7TTfuRQKyp7BLEAsbf5eM+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rVZuqOK2vfIo11sZ/I+E3dBtkj0U84jXXu6s48WXPNU=;
 b=c1f3nZ1L0WDnsICmuQ29vx48vdhH0bcBH9hyp5aMmQQfBVu90HPlABhQ6NCZob0jlSe+YW77UfyxVTHGt3OJIfsYoK0FykmtcnxfL9f/Bp7l+OVs1vWDSmFFuoU/eS333kLpLkeTtj3Fh2LcLpmAUkdJGILrQ4NTQVL7jDpFD8cfSZumJZGffuZ6lv+EC+U6i2gavmSLdHrKE+GZLYjrTzIBe/1drh8IS6ykVrrtMo7aB9lwuVVzCBRqpBoVvZvFgDMJWMvdfWhu32EbIiztQQNij8D2tcTVZqDZoBFCnvJqkNulX+IuejNchXvhaLM6Nc0UCI62SKee8hUM/8Vv6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rVZuqOK2vfIo11sZ/I+E3dBtkj0U84jXXu6s48WXPNU=;
 b=P95lNrGdYv/yW0QH9GD4s3DpkR4ssqIAHULWHkR1I92OgpR0Us5Op+EoczLRlJ9evAfKflSuh9Gxz21p4T0Q7+nCIrSG13stm/PQP7/4gDg23Pg0owvlUwW+g5MQ2kS9G8KiWPOnMWyv8Jv+1dEOtd3s1HN39vJL7B/v2te+Zho=
Received: from BYAPR12MB4791.namprd12.prod.outlook.com (2603:10b6:a03:10a::12)
 by BY5PR12MB4870.namprd12.prod.outlook.com (2603:10b6:a03:1de::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 23:57:07 +0000
Received: from BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c]) by BYAPR12MB4791.namprd12.prod.outlook.com
 ([fe80::6f3c:bd8e:8461:c28c%7]) with mapi id 15.20.6002.033; Thu, 26 Jan 2023
 23:57:07 +0000
X-SNPS-Relay: synopsys.com
From:   Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To:     Alan Stern <stern@rowland.harvard.edu>,
        Dan Scally <dan.scally@ideasonboard.com>
CC:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Explicit status phase for DWC3
Thread-Topic: Explicit status phase for DWC3
Thread-Index: AQHZL//6d6BOk0ADk0qR28S95Y3SOq6v1++AgACqcgCAAJc0gIAAENSAgAA5XgA=
Date:   Thu, 26 Jan 2023 23:57:07 +0000
Message-ID: <20230126235704.62d32y7y4sa4mmry@synopsys.com>
References: <9ce226b4-90c6-94c4-a5ad-bd623409bc51@ideasonboard.com>
 <20230126002017.tbxc3j6xdgplncfs@synopsys.com>
 <dda24f8e-8d74-c6c1-ae7c-e423bc50a143@ideasonboard.com>
 <20230126193131.ifaj7arsrrgesjh5@synopsys.com>
 <Y9LjMcO/7/VUNld3@rowland.harvard.edu>
In-Reply-To: <Y9LjMcO/7/VUNld3@rowland.harvard.edu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BYAPR12MB4791:EE_|BY5PR12MB4870:EE_
x-ms-office365-filtering-correlation-id: 45493ded-1df9-4b31-485d-08dafff9082c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: eW8xWpFomPCdUf35fJv8UDb04wEzkt2gf8AhDLl5OjKVpZ3yvuBfgmGTL58prCbMUE9qd17QYC12uxRHq9VfQ9aJgMEEWY0YMqjLDiLNYsXvg4KXMgQdgBziAqWFMvaxaVkTS8mDyFpkWjm12lg37+pCBs5K7/46L/vgQEYZCYBQaFWCrQcQo+wZmJqxkpNY+iUvcj/32RCodzU5Xl6Mqk7szTmH1MJxiQn+2Z1rJYyGrzpDmfEDFdy9oWA+AROnFJdqtLO5wpAkRSBDY6kMS2weERSuZl1SpYeUSiOEqF6VUfQQBLPrHDDwKfeyPLLfV/KX2Xpu5DwPcy71OqqxbLUBNtHtDUux8X/b6MDXl6Ciqhp3DqgdENZtkqIxdgii+64gCq7A0Z4Q1EXN6+X8V8g6iMqmVyixIHft6gxHw7IXYv3x1gdfLjz6BU7JU1LLCX2ydaJCy4TxLTwXqhGQqtZRfTv5YGNHfsGaVTye8HujSNTfzLXTrQ2FxUiQkr1RJY9qfse0qoNm/DGO+VWjS6MaVfZgeHZWilZuDNBKDyPQlTnhy1qMUE98s4yWFVuxN/SP4bx8FqI7KIeA9UTL3/ivCCupe+PDFIVYoapEWpsB1FYIzeeBkGfWo3xfuJG8uXvKobHPD9ud4/9FX8ZxSXIq3df5TAENnyHoP8xgxLoWDTVG31YW847zGzEzYeQR01rJo0Hmp2wK759aTD4PEw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR12MB4791.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(136003)(366004)(376002)(396003)(39850400004)(346002)(451199018)(86362001)(5660300002)(38070700005)(83380400001)(26005)(6512007)(2616005)(186003)(8676002)(54906003)(110136005)(316002)(36756003)(4326008)(8936002)(66476007)(66556008)(66946007)(76116006)(66446008)(478600001)(64756008)(6506007)(122000001)(71200400001)(53546011)(38100700002)(6486002)(1076003)(41300700001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SEpUVDJ6VzRSa0dOTzBTc2p3Um95akVESGJHYnpidHFJQkc3MmhVQXRMM1NN?=
 =?utf-8?B?NWgzdFA0aFNmcEo5cFczMENXNTV4MmszOWdKWE5UUTNaRWRtOHQweUhHamg0?=
 =?utf-8?B?YlRWTktDRk9KTUJlcXAxbEhtYnFsbExwYzZRNi84KzlpdGFjakRlWThQYkNI?=
 =?utf-8?B?eU96QVF4TW9ER25uS0paSWJDVVNvRHV2bXVjOXRzdmlRUysrcitRdkcxSUQz?=
 =?utf-8?B?eWVwZ1dYbzJGYWl0NlBiMmdpRXhXTlYyMlI0eG9sL3dCMW8zSHU0RE1yZ2lt?=
 =?utf-8?B?SmVpdTI5aTYyR29kSzF6aFplUVBjL211T3RJMzZnSXcvY0tmS3IrOGZDUXlQ?=
 =?utf-8?B?WitpbHNvWmhWRWltZnlLZW5QS3kyQ1M4ZDRFNzF0R1AwSTFUT2M3SU5PSndY?=
 =?utf-8?B?V3JncjZQTHdJdXlvZjJBSFREMmx4aGpsVUIrMElSS2k5YXZ2a1BJNnlzbmRF?=
 =?utf-8?B?Rmdrdjc2dnJwOVZabnVxcnp0VEF3OHQvMnhXMUZ3RFNCc09LY2c0YWN3MDd3?=
 =?utf-8?B?TW9ocndRWkQwWUt5WWN3c2Fkc0xrNTlYdytOUnFPL1I4cWlCYmdPMkxlMjFP?=
 =?utf-8?B?YjRaZW5Lakdxc2hMcUdPRXI5TnJJNmx0UDZJeEhzUFVnMkNnNGkreVU1U3Ro?=
 =?utf-8?B?U2dpWUhsQ0JxZzh6RGgvVmg2RWt6dk1ITlpaUTNlM3Y5R0hTR0VuZVRoQlRF?=
 =?utf-8?B?SzVxU0xDOGxBeDEycFlqNUVnR2lwQkk3YXg3RjlvbUJ3L1UrRk43aDc3bW5h?=
 =?utf-8?B?cGVpR0ZXSFNpK3BuR3dIWW1pbzRGa2dSRnM1VHFaK0liNFZOOTVFQ1hCWFl5?=
 =?utf-8?B?VUNyR0puOEhxMzcyNHV6V0luMnlRUkR2SVNGOStTak0xaVNVa1RZN2tXNUJ2?=
 =?utf-8?B?cnZ6V0hPcVo4aW9laTdHVGVUWHVNSi9GS3BIM1Fab2g5V0o1dGZ2azNZNVV5?=
 =?utf-8?B?R09TM1dVYnNnUGRRSi9qQXhQNkduaFhJWjg4c1VWb1ZoMlV3dTFlZVpZNjVp?=
 =?utf-8?B?alZ0clJCRXlCaUNtZHBZWVBNM3JxYU9wUGVQcG1NQnRCWGZWMVlwWmFKMW5k?=
 =?utf-8?B?NHJCL0Y5NXZsS0ZaMFFyZzBDdWNETHpmbk8zR3pBSHRrcjBXRHY2TzRQTzB3?=
 =?utf-8?B?cVFMaTZ2bTdJUUJvZ1MyTHhYS290VXI5T0xESlkrN3JqTHNKbHgzOXdCWUZI?=
 =?utf-8?B?cmFmZis3bUpmbWJSQ2htZ1U0c01OaEMwOFNCMjhJcmFxTUhENFlVaGhnTmNn?=
 =?utf-8?B?akJYQm82ZThxM094SGFSazFReXRqNnZhQTNWRG01bmNDYTNWTVMzWFoyN25j?=
 =?utf-8?B?ZnVUNVdYY1VrSGJmd3ZCWVltUFI3TkZyMFpjRUtPVjBwdXN0ZGp1c2N4NGlN?=
 =?utf-8?B?cXpCZkhTT1NaN0NOTk1Bay9jSzJWVVRWVVdJZ3pESzBDeVAwTVBHNyttMlRn?=
 =?utf-8?B?S3FCSkZ4V3E5ejR0TFN5M1NwQldzYlRuMzVSOERWSENyb3lZQ3kzbm1yOHQr?=
 =?utf-8?B?MHlSRnVMdkFDdTM3K1FRVlluV2syKzRveVk3bUttaHU1OFZ5OGs4bnYvUzJL?=
 =?utf-8?B?eHBzVCtsY1JBL0tXVjlLcjBNMGtWSmpVZWJtcThEcmtsNWhFc2pSM0ZsUmpE?=
 =?utf-8?B?ODZPUWk5dWtXT1RYa0xUZGp4cFAyVjVBcm1sb25hT1VQQXhRcWJ2UlFycFJN?=
 =?utf-8?B?Qk5xQ3gzUHg2aEJOOTI1RVFaZDlxWVdSdk5uWE4ydkM0d3JqWnNLcW1WWHRG?=
 =?utf-8?B?MjU3cWJQMm1HbGxvSzk0VVNieHBZUi9NZFNndHNaSG5CaGs4ZEZOOHlad2FZ?=
 =?utf-8?B?UEdxR2wrMXU4U1lZQXU5eGRzWCtERHZGeGJFbEpJdXgzU00vdHhYemtoalB0?=
 =?utf-8?B?ckp6TnJIeEF3dk9hMnV2Q1pYTlN2YW81a1prVEpBQmpKdXpWNDE2L3FyOEZo?=
 =?utf-8?B?UkY4K0lHTHd4WXVTZ3JvQkdBR2FBMFVLc05RNFZFMUpFWE92UUhhLzdLbmQ3?=
 =?utf-8?B?ZEV5cWJhcHhRTkJvTFhFOExsZHM5ZHhFemxXTURHYXhLT052SEJoRG1Ed05L?=
 =?utf-8?B?bFFqY281enkzSHd1VEtCWTREMk1YYk52cFlSdEFQWG9RaDlveGZpMkRFNXZT?=
 =?utf-8?B?SitjcnIrTjV3WFNGRFVNeGQ2a24vY2V1dFVpdGZRNERIU1A0NHR2SjZiejE4?=
 =?utf-8?B?UEE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <056BF3E6A029A946B33B46C455F17E05@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: SsjN0+G9ESHCei522e7tgnFO2epiw/QeqIq7QbeF512BmQ/+T0nOhnGJwEbUZMcVOvbMvj53ON4sYuYjQhh6ojxMgsI6FJVJmjEMRU9TL+3oVhezva1doZCOlsimQYqrG8pgH4uWrf4+Be+qIJ5bfZJa4cUDTzVccoAH3AEcHm7gY7F7oJd8MGzc51wnYjomk0GwN1S2N9vYLHhswYrC0oPv8Upop24MCdJCFVO4QQwgb5BddBPHbYytJR5KB8PpDHc1541vxcC/+LBcMJLOrIbPxqgxI+7BekqOMDI6aDwQ+3XftQy3ftqR6VrKoHvHdloruhv9vw4yr7bOfxu+Q7iFlT1YK+lacLF3V6Abdi1ALCsu4eB5up8aUcsfjlMB2JFM3E/t5W0xCfb2bK96EI9/JAReD42bTX2C/YoPdSMhfBZi9Wm1fXetSKOawHb4kNXNq70Mz4MiWtXGFRC/zhLKFR1pVCFIw11wIZodkobGn9RaRcdkAYtkJnx9iylDFoKrhdVSH2CRG8EX4ZjCzHp7ClAwkhHDrTnoO4FQRpE2Epg2UsL30pjUTt3oTREJN9PhbsEUy99zNCB6QmQYxcDKYo8BT+5mJGNtJOO4fvHMamvvPtRvbe4Dz8FEwCK1ohOE6WvEY/T/BTJECr9GNXnBOv543Si1lnFIvXxCsr1msN84RqppnK9XPQD4q62GdQLuPF6Iw2Lyczru6Jk3eHGNEEKFz1sXxjc8FPTyKP2ae7O8gAFPWciPIeAppcefqPPE/eiITv+u7XJJNOtlmAeZMEqAOgLiI/Y7z5sLiazXuutj9BGYjP2U7FXz6NK4+3qNEmG4jdsbTg21VTmYE9bmqduAmxYcDogp4k2sqvXuIeb/0H4JMvOG/6a02AHzG7XQWRbep2dky5m+fsmw6w==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB4791.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45493ded-1df9-4b31-485d-08dafff9082c
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jan 2023 23:57:07.4780
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: /8qTqscEmBeTwq4X7oBH1bIkonhIaMOb9Y5D5YcCa74RjXxF9gYKehE8QveOsYEqV2+WC+h7VRrUUbEGVJDB/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4870
X-Proofpoint-GUID: WUvd3vAlJSgsDjv1N5wm2raP3YZkrabV
X-Proofpoint-ORIG-GUID: WUvd3vAlJSgsDjv1N5wm2raP3YZkrabV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_09,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301260223
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

T24gVGh1LCBKYW4gMjYsIDIwMjMsIEFsYW4gU3Rlcm4gd3JvdGU6DQo+IE9uIFRodSwgSmFuIDI2
LCAyMDIzIGF0IDA3OjMxOjM0UE0gKzAwMDAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiBPbiBU
aHUsIEphbiAyNiwgMjAyMywgRGFuIFNjYWxseSB3cm90ZToNCj4gPiA+IEhpIFRoaW5oDQo+ID4g
PiANCj4gPiA+IE9uIDI2LzAxLzIwMjMgMDA6MjAsIFRoaW5oIE5ndXllbiB3cm90ZToNCj4gPiA+
ID4gT24gVHVlLCBKYW4gMjQsIDIwMjMsIERhbiBTY2FsbHkgd3JvdGU6DQo+ID4gPiA+ID4gSGkg
VGhpbmgNCj4gPiA+ID4gPiANCj4gPiA+ID4gPiANCj4gPiA+ID4gPiBJJ20gdHJ5aW5nIHRvIHVw
ZGF0ZSB0aGUgRFdDMyBkcml2ZXIgdG8gYWxsb3cgdGhlIHN0YXR1cyBwaGFzZSBvZiBhDQo+ID4g
PiA+ID4gdHJhbnNhY3Rpb24gdG8gYmUgZXhwbGljaXQ7IG1lYW5pbmcgdGhlIGdhZGdldCBkcml2
ZXIgaGFzIHRoZSBjaG9pY2UgdG8NCj4gPiA+ID4gPiBlaXRoZXIgQWNrIG9yIFN0YWxsIF9hZnRl
cl8gdGhlIGRhdGEgcGhhc2Ugc28gdGhhdCB0aGUgY29udGVudHMgb2YgdGhlIGRhdGENCj4gPiA+
ID4gPiBwaGFzZSBjYW4gYmUgdmFsaWRhdGVkLiBJIHRob3VnaHQgdGhhdCBJIHNob3VsZCBiZSBh
YmxlIHRvIGFjaGlldmUgdGhpcyBieQ0KPiA+ID4gPiA+IHByZXZlbnRpbmcgZHdjM19lcDBfeGZl
cm5vdHJlYWR5KCkgZnJvbSBjYWxsaW5nIGR3YzNfZXAwX2RvX2NvbnRyb2xfc3RhdHVzKCkNCj4g
PiA+ID4gPiAocmVseWluZyBvbiBhbiAiZXhwbGljaXRfc3RhdHVzIiBmbGFnIGFkZGVkIHRvIHRo
ZSB1c2JfcmVxdWVzdCB0byBkZWNpZGUNCj4gPiA+ID4gPiB3aGV0aGVyIG9yIG5vdCB0byBkbyBz
bykgYW5kIHRoZW4gY2FsbGluZyBpdCBtYW51YWxseSBsYXRlciBvbmNlIHRoZSBkYXRhDQo+ID4g
PiA+ID4gcGhhc2Ugd2FzIHZhbGlkYXRlZCBieSB0aGUgZ2FkZ2V0IGRyaXZlciAob3IgaW5kZWVk
IHVzZXJzcGFjZSkuIEEgdmVyeQ0KPiA+ID4gPiA+IGJhcmVib25lcyB2ZXJzaW9uIG9mIG15IGF0
dGVtcHQgdG8gZG8gdGhhdCBsb29rcyBsaWtlIHRoaXM6DQo+ID4gPiA+ID4gDQo+ID4gPiA+IFdl
IHNob3VsZG4ndCBkbyB0aGlzLiBBdCB0aGUgcHJvdG9jb2wgbGV2ZWwsIHRoZXJlIG11c3QgYmUg
YmV0dGVyIHdheXMNCj4gPiA+ID4gdG8gZG8gaGFuZHNoYWtlIHRoYW4gcmVseWluZyBvbiBwcm90
b2NvbCBTVEFMTCBfYWZ0ZXJfIHRoZSBkYXRhIHN0YWdlLg0KPiA+ID4gPiBOb3RlIHRoYXQgbm90
IGFsbCBjb250cm9sbGVycyBzdXBwb3J0IHRoaXMuDQo+ID4gPiANCj4gPiA+IA0KPiA+ID4gTWF5
YmUgSSdtIG1pc3VuZGVyc3RhbmRpbmcsIGJ1dCBpc24ndCB0aGlzIGhvdyB0aGUgVVNCIHNwZWMg
ZXhwZWN0cyBpdCB0bw0KPiA+ID4gd29yaz8gUmVhZGluZyAiUmVwb3J0aW5nIFN0YXR1cyBSZXN1
bHRzICg4LjUuMy4xKSIgaW4gdGhlIFVTQiAyLjAgc3BlYyBmb3INCj4gPiA+IHRoZSBzdGF0dXMg
c3RhZ2UgaW4gYSBjb250cm9sIHdyaXRlIGl0IHNheXMgIlRoZSBmdW5jdGlvbiByZXNwb25kcyB3
aXRoDQo+ID4gPiBlaXRoZXIgYSBoYW5kc2hha2Ugb3IgYSB6ZXJvLWxlbmd0aCBkYXRhIHBhY2tl
dCB0byBpbmRpY2F0ZSBpdHMgY3VycmVudA0KPiA+ID4gc3RhdHVzIiwgYW5kIHRoZSBoYW5kc2hh
a2UgY2FuIGJlIGVpdGhlciBTVEFMTCBvciBOQUsuIElmIHdlIGNhbid0IGRvIHRoaXMsDQo+ID4g
PiBob3cgZWxzZSBjYW4gd2UgaW5kaWNhdGUgdG8gdGhlIGhvc3QgdGhhdCB0aGUgZGF0YSBzZW50
IGR1cmluZyBhIGNvbnRyb2wgb3V0DQo+ID4gPiB0cmFuc2ZlciBpcyBpbiBzb21lIHdheSBpbnZh
bGlkPw0KPiA+ID4gDQo+ID4gDQo+ID4gTXkgY29uY2VybiBpcyBmcm9tIHRoZSBkb2N1bWVudGF0
aW9uIG5vdGVbKl0gYWRkZWQgZnJvbSB0aGlzIGNvbW1pdDoNCj4gPiA1NzljMmI0NmY3NCAoIlVT
QiBHYWRnZXQ6IGRvY3VtZW50YXRpb24gdXBkYXRlIikNCj4gDQo+IFdoZW4gdGhlIGdhZGdldCBz
dWJzeXN0ZW0gd2FzIG9yaWdpbmFsbHkgZGVzaWduZWQsIGl0IG1hZGUgbm8gYWxsb3dhbmNlIA0K
PiBmb3Igc2VuZGluZyBhIFNUQUxMIGluIHRoZSBzdGF0dXMgc3RhZ2UuICBUaGUgVURDIGRyaXZl
cnMgZXhpc3RpbmcgYXQgDQo+IHRoYXQgdGltZSB3b3VsZCBhdXRvbWF0aWNhbGx5IHNlbmQgdGhl
aXIgb3duIHplcm8tbGVuZ3RoIHN0YXR1cyBwYWNrZXQgDQo+IHdoZW4gdGhlIGNvbnRyb2wgZGF0
YSB3YXMgcmVjZWl2ZWQuDQo+IA0KPiBEcml2ZXJzIHdyaXR0ZW4gc2luY2UgdGhlbiBoYXZlIGNv
cGllZCB0aGF0IGFwcHJvYWNoLiAgVGhleSBoYWQgdG8sIGlmIA0KPiB0aGV5IHdhbnRlZCB0byB3
b3JrIHdpdGggdGhlIGV4aXN0aW5nIGdhZGdldCBkcml2ZXJzLiAgU28gdGhlIGVuZCByZXN1bHQg
DQo+IGlzIHRoYXQgZnVsbHkgc3VwcG9ydGluZyBzdGF0dXMgc3RhbGxzIHdpbGwgcmVxdWlyZSBj
aGFuZ2luZyBwcmV0dHkgbXVjaCANCj4gZXZlcnkgVURDIGRyaXZlci4NCj4gDQo+IEFzIGZvciB3
aGV0aGVyIHRoZSBVREMgaGFyZHdhcmUgaGFzIHN1cHBvcnQuLi4gIEkgZG9uJ3Qga25vdy4gIFNv
bWUgb2YgDQo+IHRoZSBlYXJsaWVyIGRldmljZXMgbWlnaHQgbm90LCBidXQgSSBleHBlY3QgdGhh
dCB0aGUgbW9yZSBwb3B1bGFyIHJlY2VudCANCj4gZGVzaWducyB3b3VsZCBwcm92aWRlIGEgd2F5
IHRvIGRvIGl0Lg0KPiANCg0KUmlnaHQsIGl0J3MganVzdCBhIGJpdCBjb25jZXJuaW5nIHdoZW4g
dGhlIGRvY3VtZW50IGFsc28gbm90ZWQgdGhpczoNCiJOb3RlIHRoYXQgc29tZSBVU0IgZGV2aWNl
IGNvbnRyb2xsZXJzIGRpc2FsbG93IHByb3RvY29sIHN0YWxsIHJlc3BvbnNlcw0KaW4gc29tZSBj
YXNlcy4iDQoNCkl0IGNvdWxkIGJlIGp1c3QgZm9yIG9sZGVyIGNvbnRyb2xsZXJzIGFzIHlvdSBt
ZW50aW9uZWQuDQoNCg0KSGkgRGFuLA0KDQpXZSBzaG91bGQgYWxyZWFkeSBoYXZlIHRoaXMgbWVj
aGFuaXNtIGluIHBsYWNlIHRvIGRvIHByb3RvY29sIFNUQUxMLg0KUGxlYXNlIGxvb2sgaW50byBk
ZWxheWVkX3N0YXR1cyBhbmQgc2V0IGhhbHQuDQoNClJlZ2FyZGluZyB0aGlzIHF1ZXN0aW9uOg0K
CUhvdyBlbHNlIGNhbiB3ZSBpbmRpY2F0ZSB0byB0aGUgaG9zdCB0aGF0IHRoZSBkYXRhIHNlbnQg
ZHVyaW5nIGENCgljb250cm9sIG91dCB0cmFuc2ZlciBpcyBpbiBzb21lIHdheSBpbnZhbGlkPw0K
DQpUeXBpY2FsbHkgdGhlcmUgc2hvdWxkIGJlIGFub3RoZXIgcmVxdWVzdCBjaGVja2luZyBmb3Ig
dGhlIGNvbW1hbmQNCnN0YXR1cy4gSSBzdXBwb3NlIGlmIHdlIHVzZSBwcm90b2NvbCBTVEFMTCwg
eW91IG9ubHkgbmVlZCB0byBzZW5kIHN0YXR1cw0KcmVxdWVzdCBjaGVjayBvbiBlcnJvciBjYXNl
cy4NCg0KVGhhbmtzLA0KVGhpbmg=
