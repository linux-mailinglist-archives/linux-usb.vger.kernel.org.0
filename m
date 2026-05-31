Return-Path: <linux-usb+bounces-38190-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QG41MLDfG2rUGwkAu9opvQ
	(envelope-from <linux-usb+bounces-38190-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 09:13:52 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A6CD614CB5
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 09:13:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E19043033FA9
	for <lists+linux-usb@lfdr.de>; Sun, 31 May 2026 07:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBEDA349CDB;
	Sun, 31 May 2026 07:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b="E7yqv3Vf"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-m15590.qiye.163.com (mail-m15590.qiye.163.com [101.71.155.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 755BB8C1F;
	Sun, 31 May 2026 07:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780211569; cv=none; b=Ao60ga/7bdHiqYmXq3xYBW6g8w1eIXK+RCpDmaVnrdpq4/I7jIJ4QymXBR4EEg+k6Cw2WLtVBMpsEqfg4yKyfIHQsqJ+WA4Xn/EDu4EACFnR+iSmHPWdTig3mjl1fYOM63/lLRFKEPhNuTdYZU4oaUMIB+q8LRQnoyAUSYyV5rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780211569; c=relaxed/simple;
	bh=4rxEG82yvl0ii1Rsr5R2iRROWMz3xHbrMoabOricMR8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hfuZNWSZSiR3z0ZNhZXySu4G7AnS3D8Pg5WFPEq28MwN/MUeplN7Tyq66SJVMmlKTzY35hjzzj47l9uQUJd6cr9p+Y3EZ7d8Oz1zx8GvP3Lr8mSutsypuwCTVWOECQ0OrU0AWM3VwfJnTYyuuzk1zkWZzLAu1g3BAvRitQNVwzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com; spf=pass smtp.mailfrom=leap-io-kernel.com; dkim=pass (2048-bit key) header.d=leap-io-kernel.com header.i=@leap-io-kernel.com header.b=E7yqv3Vf; arc=none smtp.client-ip=101.71.155.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=leap-io-kernel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=leap-io-kernel.com
Received: from localhost (unknown [222.130.22.242])
	by smtp.qiye.163.com (Hmail) with ESMTP id 40759fa20;
	Sun, 31 May 2026 14:57:09 +0800 (GMT+08:00)
Date: Sun, 31 May 2026 14:57:04 +0800
From: Kefan Bai <baikefan@leap-io-kernel.com>
To: Alex Shi <seakeel@gmail.com>
Cc: linux-usb@vger.kernel.org, si.yanteng@linux.dev,
 gregkh@linuxfoundation.org, alexs@kernel.org, dzm91@hust.edu.cn,
 corbet@lwn.net, skhan@linuxfoundation.org, linux-doc@vger.kernel.org,
 doubled@leap-io-kernel.com
Subject: Re: [PATCH v7 2/8] docs/zh_CN: Add acm.rst translation
Message-ID: <20260531145704.000061ae@leap-io-kernel.com>
In-Reply-To: <a6752fa9-b15b-4b50-baef-53c36460311e@gmail.com>
References: <cover.1779355170.git.baikefan@leap-io-kernel.com>
	<9f865599e837c90d3048b9a8004efd65b2e3f9d3.1779355170.git.baikefan@leap-io-kernel.com>
	<a6752fa9-b15b-4b50-baef-53c36460311e@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=GB18030
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9e7cd279d003ackunmeb980cf015a72e
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkaHk1MVksYTRpJTE8fThoZGVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSkhLVUlJVUlPSVlXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=E7yqv3Vfi6WVXQhx9qDA960mxIMsIRdy6orbLw3nh8sCIREPqMyXFw9mloc7ehrJ3UhkXkv2JZWsu9UBIEtUyDMgXkkcYDJiheUy3CBgVJSH3V95w2H2dVuPpktKNhf5VzE5JsoQHF0VJDSVjgLGcz0KzNFF47LcLMfOkWV/GzaU50bjyM/623tjV6dzEGDZkZ+pXMHroBgMhhhtXc4H4Pr7obpHnfrcjsKicn9/t1W/Ui8tdh0LKmvQcLorofM51dB0gcdwUC3yl+2lEHBKauLt8ZW7FNi1oOmuQRW2NeGZM7ITIkVg68RSOxBLB+iFWqDxUs/FT5ZxpJn0K+gGeg==; s=default; c=relaxed/relaxed; d=leap-io-kernel.com; v=1;
	bh=28k+EV+xM3AcribAqaKcns0myL5jorq6Xdjrk30tScU=;
	h=date:mime-version:subject:message-id:from;
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[leap-io-kernel.com,quarantine];
	R_DKIM_ALLOW(-0.20)[leap-io-kernel.com:s=default];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-38190-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[baikefan@leap-io-kernel.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[leap-io-kernel.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,suse.cz:email,cqsoftware.com.cn:email,leap-io-kernel.com:email,leap-io-kernel.com:mid,leap-io-kernel.com:dkim]
X-Rspamd-Queue-Id: 2A6CD614CB5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, 25 May 2026 10:05:23 +0800
Alex Shi <seakeel@gmail.com> wrote:

> 
> 
> On 2026/5/21 17:55, Kefan Bai wrote:
> > Translate .../usb/acm.rst into Chinese
> > 
> > Update the translation through commit ecefae6db042
> > ("docs: usb: rename files to .rst and add them to drivers-api")
> > 
> > Reviewed-by: Yanteng Si<siyanteng@cqsoftware.com.cn>
> > Signed-off-by: Kefan Bai<baikefan@leap-io-kernel.com>
> > ---
> >   Documentation/translations/zh_CN/usb/acm.rst  | 147
> > ++++++++++++++++++ .../translations/zh_CN/usb/index.rst          |
> >  2 +- 2 files changed, 148 insertions(+), 1 deletion(-)
> >   create mode 100644 Documentation/translations/zh_CN/usb/acm.rst
> > 
> > diff --git a/Documentation/translations/zh_CN/usb/acm.rst
> > b/Documentation/translations/zh_CN/usb/acm.rst new file mode 100644
> > index 000000000000..51d6eb8f5660
> > --- /dev/null
> > +++ b/Documentation/translations/zh_CN/usb/acm.rst
> > @@ -0,0 +1,147 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +.. include:: ../disclaimer-zh_CN.rst
> > +
> > +:Original: Documentation/usb/acm.rst
> > +
> > +:翻译:
> > +
> > + 白钶凡 Kefan Bai<baikefan@leap-io-kernel.com>
> > +
> > +:校译:
> > +
> > +
> > +====================
> > +Linux ACM 驱动 v0.16
> > +====================
> > +
> > +版权所有 (c) 1999 Vojtech Pavlik<vojtech@suse.cz>
> > +
> > +由 SuSE 赞助
> > +
> > +0. 免责声明
> > +~~~~~~~~~~~
> > +本程序是自由软件；你可以在自由软件基金会发布的
> > +GNU 通用公共许可证第 2 版，或者（按你的选择）
> > +任何后续版本的条款下重新发布和/或修改它。
> > +
> > +发布本程序是希望它能发挥作用，但它不附带任何担保；
> > +甚至不包括对适销性或特定用途适用性的默示担保。
> > +详情见 GNU 通用公共许可证。
> 
> Hi Kefan,
> 
> The alignment means we will try use the width for each of lines, not 
> just stop for each of punctuation. Please fix all patches alignment,
> try to expand the whole width for lines unless it's broken a word or
> unreadable.
> 
> Thanks

Hi Alex,

  Sorry for the late reply, and thanks for the review.

  I understand the formatting point now. The translated text should be
  reflowed more evenly, instead of breaking too early around
  punctuation.

  Greg queued this series in usb-testing on May 21, 2026, and then
  moved it into usb-next on May 27, 2026. At this point, would you
  prefer me to leave the current series as-is and follow this rule in
  future translations, or send a small follow-up cleanup patch on top
  of usb-next?

  Thanks,
  Kefan

> > +
> > +你应该已经随本程序收到了 GNU 通用公共许可证的副本；
> > +如果没有，请致信：Free Software Foundation, Inc., 59
> > +Temple Place, Suite 330, Boston, MA 02111-1307 USA。
> > +
> > +如需联系作者，可发送电子邮件至vojtech@suse.cz，
> > +或邮寄至：
> > +Vojtech Pavlik, Ucitelska 1576, Prague 8,
> > +182 00, Czech Republic。
> > +
> > +为方便起见，软件包中已附带 GNU 通用公共许可证
> > +第 2 版：见 COPYING 文件。
> > +
> > +1. 使用方法
> > +~~~~~~~~~~~
> > +``drivers/usb/class/cdc-acm.c`` 驱动可用于符合 USB
> > +通信设备类抽象控制模型（USB CDC ACM）规范的
> > +USB 调制解调器和 USB ISDN 终端适配器。
> > +
> > +许多调制解调器支持此驱动，以下是我所知道的一些型号：
> > +
> > +	- 3Com OfficeConnect 56k
> > +	- 3Com Voice FaxModem Pro
> > +	- 3Com Sportster
> > +	- MultiTech MultiModem 56k
> > +	- Zoom 2986L FaxModem
> > +	- Compaq 56k FaxModem
> > +	- ELSA Microlink 56k
> > +
> > +我知道有一款 ISDN 终端适配器可以与 ACM 驱动一起使用：
> > +
> > +	- 3Com USR ISDN Pro TA
> > +
> > +一些手机也可以通过 USB 连接。
> > +我知道以下机型可以正常工作：
> > +
> > +	- SonyEricsson K800i
> > +
> > +遗憾的是，许多调制解调器和大多数 ISDN TA
> > +都使用专有接口，因此无法与此驱动配合工作。
> > +购买前请先确认设备是否符合 ACM 规范。
> > +
> > +要使用这些调制解调器，需要加载以下模块::
> > +
> > +	usbcore.ko
> > +	uhci-hcd.ko ohci-hcd.ko or ehci-hcd.ko
> > +	cdc-acm.ko
> > +
> > +之后就应该可以访问这些调制解调器了。
> > +应当可以使用 ``minicom``、``ppp`` 和 ``mgetty``
> > +与它们通信。
> > +
> > +2. 验证驱动是否正常工作
> > +~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +第一步是检查 ``/sys/kernel/debug/usb/devices``，
> > +其内容应该类似如下::
> > +
> > +  T:  Bus=01 Lev=00 Prnt=00 Port=00 Cnt=00 Dev#=  1 Spd=12  MxCh= 2
> > +  B:  Alloc=  0/900 us ( 0%), #Int=  0, #Iso=  0
> > +  D:  Ver= 1.00 Cls=09(hub  ) Sub=00 Prot=00 MxPS= 8 #Cfgs=  1
> > +  P:  Vendor=0000 ProdID=0000 Rev= 0.00
> > +  S:  Product=USB UHCI Root Hub
> > +  S:  SerialNumber=6800
> > +C:* #Ifs= 1 Cfg#= 1 Atr=40 MxPwr=  0mA
> > +  I:  If#= 0 Alt= 0 #EPs= 1 Cls=09(hub  ) Sub=00 Prot=00 Driver=hub
> > +  E:  Ad=81(I) Atr=03(Int.) MxPS=   8 Ivl=255ms
> > +  T:  Bus=01 Lev=01 Prnt=01 Port=01 Cnt=01 Dev#=  2 Spd=12  MxCh= 0
> > +  D:  Ver= 1.00 Cls=02(comm.) Sub=00 Prot=00 MxPS= 8 #Cfgs=  2
> > +  P:  Vendor=04c1 ProdID=008f Rev= 2.07
> > +  S:  Manufacturer=3Com Inc.
> > +  S:  Product=3Com U.S. Robotics Pro ISDN TA
> > +  S:  SerialNumber=UFT53A49BVT7
> > +  C:  #Ifs= 1 Cfg#= 1 Atr=60 MxPwr=  0mA
> > +  I:  If#= 0 Alt= 0 #EPs= 3 Cls=ff(vend.) Sub=ff Prot=ff Driver=acm
> > +  E:  Ad=85(I) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> > +  E:  Ad=04(O) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> > +  E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=128ms
> > +C:* #Ifs= 2 Cfg#= 2 Atr=60 MxPwr=  0mA
> > +  I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=01 Driver=acm
> > +  E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=128ms
> > +  I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00 Driver=acm
> > +  E:  Ad=85(I) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> > +  E:  Ad=04(O) Atr=02(Bulk) MxPS=  64 Ivl=  0ms
> > +
> > +这三行的存在很关键（以及 ``Cls=`` 字段里出现的
> > +``comm`` 和 ``data`` 类）；它说明这是一个 ACM
> > +设备。``Driver=acm`` 表示该设备正在使用 acm 驱动。
> > +如果只看到 ``Cls=ff(vend.)``，那就无能为力了：
> > +这说明你手上的设备使用的是厂商专有接口::
> > +
> > +    D:  Ver= 1.00 Cls=02(comm.) Sub=00 Prot=00 MxPS= 8 #Cfgs=  2
> > +    I:  If#= 0 Alt= 0 #EPs= 1 Cls=02(comm.) Sub=02 Prot=01
> > Driver=acm
> > +    I:  If#= 1 Alt= 0 #EPs= 2 Cls=0a(data ) Sub=00 Prot=00
> > Driver=acm +
> > +在系统日志中应该可以看到::
> > +
> > +  usb.c: USB new device connect, assigned device number 2
> > +  usb.c: kmalloc IF c7691fa0, numif 1
> > +  usb.c: kmalloc IF c7b5f3e0, numif 2
> > +  usb.c: skipped 4 class/vendor specific interface descriptors
> > +  usb.c: new device strings: Mfr=1, Product=2, SerialNumber=3
> > +  usb.c: USB device number 2 default language ID 0x409
> > +  Manufacturer: 3Com Inc.
> > +  Product: 3Com U.S. Robotics Pro ISDN TA
> > +  SerialNumber: UFT53A49BVT7
> > +  acm.c: probing config 1
> > +  acm.c: probing config 2
> > +  ttyACM0: USB ACM device
> > +  acm.c: acm_control_msg: rq: 0x22 val: 0x0 len: 0x0 result: 0
> > +  acm.c: acm_control_msg: rq: 0x20 val: 0x0 len: 0x7 result: 7
> > +  usb.c: acm driver claimed interface c7b5f3e0
> > +  usb.c: acm driver claimed interface c7b5f3f8
> > +  usb.c: acm driver claimed interface c7691fa0
> > +
> > +如果以上都正常，请启动 ``minicom``，
> > +把它配置为连接 ``ttyACM`` 设备，然后
> > +尝试输入 ``at``。如果返回 ``OK``，说明一切工作正常。
> > diff --git a/Documentation/translations/zh_CN/usb/index.rst
> > b/Documentation/translations/zh_CN/usb/index.rst index
> > b4cb0ccaa39b..686e5b0a9384 100644 ---
> > a/Documentation/translations/zh_CN/usb/index.rst +++
> > b/Documentation/translations/zh_CN/usb/index.rst @@ -17,10 +17,10
> > @@ USB 支持 .. toctree::
> >       :maxdepth: 1
> > 
> > +    acm
> > 
> >   Todolist:
> > 
> > -* acm
> >   * authorization
> >   * chipidea
> >   * dwc3
> > --
> > 2.54.0
> > 
> 
> 
> 


