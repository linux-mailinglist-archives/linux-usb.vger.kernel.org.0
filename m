Return-Path: <linux-usb+bounces-29939-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBC7C23D56
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 09:34:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4FDB63BAB42
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 08:31:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 831B72C0273;
	Fri, 31 Oct 2025 08:31:49 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE0C1C8605
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 08:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761899509; cv=none; b=j22x5EiYmxAmdh8bNMh+Uy+a+hbt1E7CALWhC1nXuXTveN100fSVIEgvnMqGCQZhRWzfFtDfooGug0WYEXGrplls29BmdA2YWwNIwbCu636cTuCB1MpZ92aLQw8Uzr9mcUP25Uvipo9Gj4JqizptJoIc/PKTuLz7y9N1CxzO2H0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761899509; c=relaxed/simple;
	bh=/nj/g94yZZoUqNOe9qhlTUKEsBSWuB2shnu8bOGcmak=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p1+lLKfDagTUIjmAw1qqI/MO26F8ycfTHq0M3FUQ33loBHMrJVSMYkfbs80Z8sldRkjsmytdMbM1Gf+X3mCvUSbF4Yh5iTEoJ62+oN4K0Jw37+7FeZH5vqK5JNiJBeAN7ee8KGg5pLjF9QsFWOYObQUH7oWRjEsb9dPRDCcEGt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso1700808a12.3
        for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 01:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761899505; x=1762504305;
        h=content-transfer-encoding:fcc:user-agent:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZJVYBJYk+QKdyleamEHH3mIJfj4KS62ZWWHJ+kEKnaM=;
        b=Xn/+zALIqRadzrA0I3ixmz62IrPI+3NGgG4WGI4N1QIbWLG8z2LkmVh6+Pncvh/fmr
         RVmiQFqIjcwhxST3bl4LFsIzSdgsq0P9KbbyleoLkAHIT+IXBXmydUGDbW31adtRgd33
         nsbyWDeoTK2M2jZlQCEoeAmesRZ5AaD+RD3vhCM9GbbhJgV6UmlO7Td55YbQNRfrivRS
         Oqkps+M46zfZ/THhpl9YVEjLhSBk14xDRNC0orrtHik/r6nTH5VPkSdctwNqxTC2sgf+
         tUwpH89CxQ2mDS7+i2ScomzSPZ4ZBadmUOB1CEZfQmwhkrpuylRCltIlO7hCQ3vG9coL
         PZcA==
X-Forwarded-Encrypted: i=1; AJvYcCU2dYzsV0JpF7cfPQZNC7UkhSrjpc5/KD/Lp3f3QZ9NiqEAOehe7a5nOwfOnsQX3domgnb83hMmXy0=@vger.kernel.org
X-Gm-Message-State: AOJu0YybhPhlZC2yfMcYG0ksYkWDSdyjOoFo/8vrLVe3Y16ACUGifZBP
	zwoHkZwc2dhaLZSOVokLJe+1ZpHd9tMvu/LE1XnFaC6/q9SpINvQa5Ha
X-Gm-Gg: ASbGncvRXcWX85tpMtJwBlyqrnAxBnURdTxzsYiAOl+PVKGE6PrNQTqwG5a/ZHYgS8l
	4psG2HhwNyafDyVLuifRKuRMStKqcQHBr48YiU2Zee5IyaS1pdZEumniUaypNjtxkvaoE6eu9Bu
	ULq+kQvf2pUO0T8CwqLoto7YdoxZ1Xd0XR+GxSkijJzpmenoU0r5s0U+9TvZypar7dIiDPPErcI
	JXJbhdKpGQZ1/NS4487ZRATqnOPK3YH4a9XqrEA1PUMJdW0Ggtfgk5vjeb9XEpaZSKcnwx9JtGe
	0GHgTu7CABe95Q2Teau7qfYgsQQEPMYrQQpPs5/zU7DBmprhEw7aoJVLPAuWY/zsnzDW2eYUV4i
	Bsj4UTqj0xFRGtzxUBNrf+0FOKGIqrzdOc0gDsY6qxEUgiChmbAeFztsBIYy5Y2e9BJjnTt7ojp
	XC91yTflpANVIRQgHacJ8m2SSxf/g=
X-Google-Smtp-Source: AGHT+IFhrFcWVwSsDY9O9tnbi3AnONEYcOyTbNlOy4ib0hR+Xx5JwJTXrPODaa80OW89xOOnyyo+hg==
X-Received: by 2002:a17:903:11c3:b0:290:c5e5:4d90 with SMTP id d9443c01a7336-2951a524561mr32538655ad.42.1761899504891;
        Fri, 31 Oct 2025 01:31:44 -0700 (PDT)
Received: from localhost.localdomain ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295269bc8d4sm14533205ad.102.2025.10.31.01.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 01:31:44 -0700 (PDT)
From: Hongyu Xie <xiehongyu1@kylinos.cn>
To: mathias.nyman@linux.intel.com,
	mathias.nyman@intel.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	xiehongyu1@kylinos.cn
Subject: Re: [PATCH v1] usb: xhci: limit run_graceperiod for only usb 3.0
 devices
Date: Fri, 31 Oct 2025 16:31:37 +0800
Message-Id: <b8ac5a69-22e0-4581-85cb-e8a8130e005e@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <7d19444c-930e-4f43-b7bc-00c746d38cc0@linux.intel.com>
References: <20251017121254.2887283-1-xiehongyu1@kylinos.cn>
 <7d19444c-930e-4f43-b7bc-00c746d38cc0@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
X-Mozilla-Draft-Info: internal/draft; vcard=0; receipt=0; DSN=0; uuencode=0;
 attachmentreminder=0; deliveryformat=1
X-Identity-Key: id1
Fcc: imap://xiehongyu1%40kylinos.cn@mail.kylinos.cn/Sent
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hello,=0D
   Anything new about this patch?=0D
=0D
=E5=9C=A8 2025/10/20 19:20, Mathias Nyman =E5=86=99=E9=81=93:=0D
> On 10/17/25 15:12, Hongyu Xie wrote:=0D
>> run_graceperiod blocks usb 2.0 devices from auto suspending after=0D
>> xhci_start for 500ms.=0D
>>=0D
>> Log shows:=0D
>> [=C2=A0=C2=A0 13.387170] xhci_hub_control:1271: xhci-hcd PNP0D10:03: Get=
 port =0D
>> status 7-1 read: 0x2a0, return 0x100=0D
>> [=C2=A0=C2=A0 13.387177] hub_event:5779: hub 7-0:1.0: state 7 ports 1 ch=
g 0000 =0D
>> evt 0000=0D
>> [=C2=A0=C2=A0 13.387182] hub_suspend:3903: hub 7-0:1.0: hub_suspend=0D
>> [=C2=A0=C2=A0 13.387188] hcd_bus_suspend:2250: usb usb7: bus auto-suspen=
d, wakeup 1=0D
>> [=C2=A0=C2=A0 13.387191] hcd_bus_suspend:2279: usb usb7: suspend raced w=
ith =0D
>> wakeup event=0D
>> [=C2=A0=C2=A0 13.387193] hcd_bus_resume:2303: usb usb7: usb auto-resume=
=0D
>> [=C2=A0=C2=A0 13.387296] hub_event:5779: hub 3-0:1.0: state 7 ports 1 ch=
g 0000 =0D
>> evt 0000=0D
>> [=C2=A0=C2=A0 13.393343] handle_port_status:2034: xhci-hcd PNP0D10:02: =
=0D
>> handle_port_status: starting usb5 port polling.=0D
>> [=C2=A0=C2=A0 13.393353] xhci_hub_control:1271: xhci-hcd PNP0D10:02: Get=
 port =0D
>> status 5-1 read: 0x206e1, return 0x10101=0D
>> [=C2=A0=C2=A0 13.400047] hub_suspend:3903: hub 3-0:1.0: hub_suspend=0D
>> [=C2=A0=C2=A0 13.403077] hub_resume:3948: hub 7-0:1.0: hub_resume=0D
>> [=C2=A0=C2=A0 13.403080] xhci_hub_control:1271: xhci-hcd PNP0D10:03: Get=
 port =0D
>> status 7-1 read: 0x2a0, return 0x100=0D
>> [=C2=A0=C2=A0 13.403085] hub_event:5779: hub 7-0:1.0: state 7 ports 1 ch=
g 0000 =0D
>> evt 0000=0D
>> [=C2=A0=C2=A0 13.403087] hub_suspend:3903: hub 7-0:1.0: hub_suspend=0D
>> [=C2=A0=C2=A0 13.403090] hcd_bus_suspend:2250: usb usb7: bus auto-suspen=
d, wakeup 1=0D
>> [=C2=A0=C2=A0 13.403093] hcd_bus_suspend:2279: usb usb7: suspend raced w=
ith =0D
>> wakeup event=0D
>> [=C2=A0=C2=A0 13.403095] hcd_bus_resume:2303: usb usb7: usb auto-resume=
=0D
>> [=C2=A0=C2=A0 13.405002] handle_port_status:1913: xhci-hcd PNP0D10:04: P=
ort =0D
>> change event, 9-1, id 1, portsc: 0x6e1=0D
>> [=C2=A0=C2=A0 13.405016] hub_activate:1169: usb usb5-port1: status 0101 =
change 0001=0D
>> [=C2=A0=C2=A0 13.405026] xhci_clear_port_change_bit:658: xhci-hcd PNP0D1=
0:02: =0D
>> clear port1 connect change, portsc: 0x6e1=0D
>> [=C2=A0=C2=A0 13.413275] hcd_bus_suspend:2250: usb usb3: bus auto-suspen=
d, wakeup 1=0D
>> [=C2=A0=C2=A0 13.419081] hub_resume:3948: hub 7-0:1.0: hub_resume=0D
>> [=C2=A0=C2=A0 13.419086] xhci_hub_control:1271: xhci-hcd PNP0D10:03: Get=
 port =0D
>> status 7-1 read: 0x2a0, return 0x100=0D
>> [=C2=A0=C2=A0 13.419095] hub_event:5779: hub 7-0:1.0: state 7 ports 1 ch=
g 0000 =0D
>> evt 0000=0D
>> [=C2=A0=C2=A0 13.419100] hub_suspend:3903: hub 7-0:1.0: hub_suspend=0D
>> [=C2=A0=C2=A0 13.419106] hcd_bus_suspend:2250: usb usb7: bus auto-suspen=
d, wakeup 1=0D
>> [=C2=A0=C2=A0 13.419110] hcd_bus_suspend:2279: usb usb7: suspend raced w=
ith =0D
>> wakeup event=0D
>> [=C2=A0=C2=A0 13.419112] hcd_bus_resume:2303: usb usb7: usb auto-resume=
=0D
>> [=C2=A0=C2=A0 13.420455] handle_port_status:2034: xhci-hcd PNP0D10:04: =
=0D
>> handle_port_status: starting usb9 port polling.=0D
>> [=C2=A0=C2=A0 13.420493] handle_port_status:1913: xhci-hcd PNP0D10:05: P=
ort =0D
>> change event, 10-1, id 1, portsc: 0x6e1=0D
>> [=C2=A0=C2=A0 13.425332] hcd_bus_suspend:2279: usb usb3: suspend raced w=
ith =0D
>> wakeup event=0D
>> [=C2=A0=C2=A0 13.431931] handle_port_status:2034: xhci-hcd PNP0D10:05: =
=0D
>> handle_port_status: starting usb10 port polling.=0D
>> [=C2=A0=C2=A0 13.435080] hub_resume:3948: hub 7-0:1.0: hub_resume=0D
>> [=C2=A0=C2=A0 13.435084] xhci_hub_control:1271: xhci-hcd PNP0D10:03: Get=
 port =0D
>> status 7-1 read: 0x2a0, return 0x100=0D
>> [=C2=A0=C2=A0 13.435092] hub_event:5779: hub 7-0:1.0: state 7 ports 1 ch=
g 0000 =0D
>> evt 0000=0D
>> [=C2=A0=C2=A0 13.435096] hub_suspend:3903: hub 7-0:1.0: hub_suspend=0D
>> [=C2=A0=C2=A0 13.435102] hcd_bus_suspend:2250: usb usb7: bus auto-suspen=
d, wakeup 1=0D
>> [=C2=A0=C2=A0 13.435106] hcd_bus_suspend:2279: usb usb7: suspend raced w=
ith =0D
>> wakeup event=0D
>>=0D
>> usb7 and other usb 2.0 root hub were rapidly toggling between suspend=0D
>> and resume states. More, "suspend raced with wakeup event" confuses =0D
>> people.=0D
>>=0D
>> So, limit run_graceperiod for only usb 3.0 devices=0D
>>=0D
>> Signed-off-by: Hongyu Xie <xiehongyu1@kylinos.cn>=0D
> =0D
> Sounds reasonable. I don't recall USB 2.0 devices needing this.=0D
> =0D
> Hub driver has also changed a bit since the xhci run_graceperiod was adde=
d.=0D
> USB 3 hubs are no longer aggressively runtime suspending after resume. Se=
e:=0D
> 8f5b7e2bec1c usb: hub: fix detection of high tier USB3 devices behind =0D
> suspended hubs=0D
> =0D
> We could possibly get rid of the whole xhci run_graceperiod by extending =
=0D
> the hub driver=0D
> change to cover both init and resume paths.=0D
> =0D
> This patch is a good step in that direction=0D
> =0D
> Thanks=0D
> Mathias=0D
=0D

