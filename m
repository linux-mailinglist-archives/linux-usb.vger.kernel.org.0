Return-Path: <linux-usb+bounces-34776-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOCqIiG+tGkZsgAAu9opvQ
	(envelope-from <linux-usb+bounces-34776-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 02:47:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC9228B4AF
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 02:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EF12A30B1962
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 01:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3710A2475CF;
	Sat, 14 Mar 2026 01:47:06 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from r9110.ps.combzmail.jp (r9110.ps.combzmail.jp [49.212.36.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C454D221F06
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 01:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.212.36.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773452825; cv=none; b=QY8RWW1UbrROjwINZrI4y3vU5LSw7PxEHXlstaZUZTAB7PotZwpEOxtHqhOkZJb/p3eyNRCClYFlQluCgKnp3hRtp2h/axsypMQfbkHO020WzRMAZJY+sxikgrVlsyG2V7DVlW6KRtp07eX6dgllhy9njjonMmbtUyB25R5QwCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773452825; c=relaxed/simple;
	bh=gaxADsOpGh2R7TrfuYIbKk9k6zkvNv87ynFzd0C/yTc=;
	h=To:From:Subject:Mime-Version:Content-Type:Message-Id:Date; b=tG0Rfs0LML0k42KwtPFhYYM44lMlxpkiYwhM1bFnBhiNZ5YNVT/zMr+14gkh/VuxJzdEUdSe2rcxDINB9Yy98tXmyqKrCxVlaYZ7RgPsOkRneIAirlol3/rz1R3xuaMtMEWYoln1WeKycsDDnY4YCaWA0vYB1TB+HwjxjIsBe54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=j-pet-hotel.jp; spf=pass smtp.mailfrom=magerr.combzmail.jp; arc=none smtp.client-ip=49.212.36.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=j-pet-hotel.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=magerr.combzmail.jp
Received: by r9110.ps.combzmail.jp (Postfix, from userid 99)
	id A765E188279; Sat, 14 Mar 2026 10:46:44 +0900 (JST)
DKIM-Filter: OpenDKIM Filter v2.11.0 r9110.ps.combzmail.jp A765E188279
To: linux-usb@vger.kernel.org
From: =?ISO-2022-JP?B?GyRCRnxLXCVaJUMlSCVbJUYlazYoMnEbKEI=?= <info@j-pet-hotel.jp>
X-Ip: 126807571238744
X-Ip-source: k85gj72w48dnsa51u0p6gd
Precedence: bulk
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Subject: =?ISO-2022-JP?B?GyRCJVolQyVIJHIwJiQ5JGshIjdQMUQ8VE1NGyhC?=
 =?ISO-2022-JP?B?GyRCJFgbKEI=?=
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-2022-jp
Content-Transfer-Encoding: 7bit
X-MagazineId: 2w51
X-uId: 6764245238486059665034691052
X-Sender: CombzMailSender
X-Url: http://www.combzmail.jp/
Message-Id: <20260314014655.A765E188279@r9110.ps.combzmail.jp>
Date: Sat, 14 Mar 2026 10:46:44 +0900 (JST)
X-Spamd-Result: default: False [10.85 / 15.00];
	FUZZY_DENIED(10.51)[1:393dfcef26:1.00:txt];
	MV_CASE(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-34776-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[j-pet-hotel.jp];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	GREYLIST(0.00)[pass,body];
	MISSING_XM_UA(0.00)[];
	ARC_ALLOW(0.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[info@j-pet-hotel.jp,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	R_SPF_ALLOW(0.00)[+ip4:172.234.253.10:c];
	RCPT_COUNT_ONE(0.00)[1]
X-Rspamd-Queue-Id: 0DC9228B4AF
X-Rspamd-Action: add header
X-Rspamd-Server: lfdr
X-Spam: Yes

　
　ペットを愛する、経営者様へ
　
　
　地域で愛犬を安心して預けられる
　ペットホテル・トリミング事業を始めませんか？
　
　
　■　フランチャイズシステム説明会　■
　
　　　愛犬家のオーナー多数！
　　　ペットホテル・トリミングサロン
　　　“ONE LUKE（ワンルーク）”
　
　　　※「開業パック」をご用意しているので
　　　　経験や資格が無くても始められます。
　
　
　■　開催方式
　　　オンライン（申込後に参加方法をご案内）
　
　■　日程
　　　3月16日（月）11:00〜12:00　残り1枠
　　　3月19日（木）15:00〜16:00　残り1枠
　　　3月24日（火）13:00〜14:00

　■　定員
　　　5名
　
　■　参加申込はこちら
　　　https://oneluke-fc-seminar.jp/lp/
　
　
　お世話になります。
　
　この度は、ペットホテル・トリミングサロンの
　フラチャイズ事業説明会の開催をご案内いたします。
　
　ペットホテルとトリミングサービスを提供する
　
　ONE LUKE（ワンルーク）
　
　は、ワンちゃんが好きすぎる創業者が実際に
　ペットホテルに預けたときに感じた不安や
　思ったことを施設づくりに活かしています。
　
　
　例えばワンちゃんが泊まるときに、少しでも
　広く、心地よく過ごして欲しいという思いから、
　鉄のゲージではなくオーダーで職人さんに
　「お部屋」をつくっていただいています。
　　
　そうした愛犬家目線のきめ細かいサービスが支持され、
　ワンルークを利用した方は高い確率でリピートしてくれます。
　
　
　日本ではいまや「8世帯に1世帯」がペットを飼うまでに
　増えてきましたが、ペットホテルはまだまだ店舗数が
　足りていないため、今後も成長が期待できます。
　
　
　ここまでこの文章を読まれたということは、
　あなたもワンちゃんが大好きなのではないでしょうか。
　
　ワンルークのFCオーナー様も愛犬家が多く、中には
　ご自身が利用者だった、という方もいらっしゃいます。
　
　
　説明会にて詳しいビジネスモデルをお伝えしますので、
　新規事業を探している愛犬家の経営者様は
　この機会にぜひご参加ください。
　
　
　地域のペットライフを豊かにし、愛犬が安心して
　過ごせる空間を一緒につくっていきましょう。
　
　
　■　フランチャイズシステム説明会　■
　
　　　愛犬家のオーナー多数！
　　　ペットホテル・トリミングサロン
　　　“ONE LUKE（ワンルーク）”
　
　■　参加申込はこちら
　　　https://oneluke-fc-seminar.jp/lp/
　
***********************************************************************
本メールのご不要な方には大変ご迷惑をおかけいたしました。
お手数お掛けしますが、メール不要のお手続きは
下記URLよりお願いいたします。
<メール停止フォーム>
　https://oneluke-fc-seminar.jp/mail/
***********************************************************************
日本ペットホテル協会株式会社
愛知県名古屋市千種区内山3丁目9-23 3F
TEL:052-784-8416
***********************************************************************

